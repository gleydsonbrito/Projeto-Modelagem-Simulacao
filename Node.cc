#include <string.h>
#include <omnetpp.h>
#include <algorithm>
#include <iostream>
#include <numeric>
#include <random>
#include <vector>

#include "Token.h"
#include "Edge.h"

using namespace omnetpp;

class Node: public cSimpleModule {
private:
    //o gerador randômico precisa ficar sendo reutilizado. se criar a cada uso, ele irá sempre retornar o mesmo valor.
    std::default_random_engine rng;

    //retorna os índices da porta "out" randomizados
    std::vector<int> outRandomIndexes() {
        int len = gateSize("out");
        std::vector<int> v(len);
        std::iota(v.begin(), v.end(), 0);
        std::shuffle(v.begin(), v.end(), rng);
        return v;
    }

    cHistogram distStats;
    cHistogram workStats;
    cOutVector cOutVectorDist;
    cOutVector cOutVectorWork;

protected:
    virtual int selectGate(Token *token);
    virtual void handleMessage(cMessage *msg) override;
    virtual void initialize() override;
};

Define_Module(Node);

void Node::initialize() {
    this->rng = std::default_random_engine { };
}

//Seleciona uma porta aleatória que leve a um edge permitido.
//caso não haja nenhuma, será retornado -1.
int Node::selectGate(Token *token) {
    std::vector<int> v = outRandomIndexes();
    for (int i : v) {
        cGate *outGate = gate("out", i);
        Edge *edge = (Edge*) outGate->getChannel();
        if (edge->isAllowed(token)) {
            return i;
        }
    }
    return -1;
}

void Node::handleMessage(cMessage *msg) {

    Token *token = (Token*) msg;
    int gateIndex = selectGate(token);
    if (gateIndex > -1) {
        cGate *outGate = gate("out", gateIndex);
        Edge *edge = (Edge*) outGate->getChannel();

        double dist = edge->getDistance();
        int height = edge->getHeight();

        EV<< "Distance between node = " << dist << "\n";

        double efort = edge->getEfort(dist, height);

        EV << "Efort = " << efort << "\n";

        double task = edge->WorkTask(dist, efort);

        EV<< "Task = " << task << "\n";

        distStats.collect(dist);
        workStats.collect(task);

        cOutVectorDist.record(dist);
        cOutVectorWork.record(task);

        send(msg, "out", gateIndex);
    } else {
        delete msg;
    }
}

