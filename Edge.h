#ifndef __MS_EDGE_H
#define __MS_EDGE_H

#include <string.h>
#include <omnetpp.h>
#include "Token.h"

using namespace omnetpp;

class Edge: public cChannel {
private:
    double distance;
    int height;
    double totalEfort = 0.0;
    bool special;

    const double m = 75;
    const double phi = 0.85;
    const double g = 9.8;

protected:
    bool isTransmissionChannel() const override {
        return false;
    }
    simtime_t getTransmissionFinishTime() const override {
        return SimTime::ZERO;
    }
    double getNominalDatarate() const override {
        return 0.0;
    }
    simtime_t calculateDuration(cMessage *msg) const override {
        return SimTime::ZERO;
    }
    void forceTransmissionFinishTime(simtime_t t) override {
    }

    virtual void initialize() override {
        this->distance = par("distance");
        this->height = par("height");
        this->special = par("special");
    }

    void processMessage(cMessage *msg, simtime_t t, result_t &result) override {
        Token *token = (Token*) msg;
        if (!isAllowed(token)) {
            delete msg;
        }

        token->append(this->distance);
        //se o token for regular, o delay é igual à distância. Se não, é a metade da distância.
        double delay = this->distance;
        if (token->special) {
            delay = this->distance / 2.0;
        }
        result.delay = delay;
    }

public:
    //o token só é permitido pelo caminho se for um token "special" ou se o caminho NÃO for special (ou seja,
    //o caminho suporta tokens especiais e não especiais).
    bool isAllowed(Token *token) {
        return token->special || !(this->special);
    }

    double getDistance() {
        return this->distance;
    }

    int getHeight() {
        return this->height;
    }

    void setTotalEfort(double efort) {
        this->totalEfort += efort;
    }

    double getTotalEfort() {
        return this->totalEfort;
    }

    double getHypotenuse(double dist, int h) {
        return sqrt((dist * dist) + (h * h));
    }

    double getSine(double dist, double h) {
        double hyp = getHypotenuse(dist, h);
        return h / hyp;
    }

    double getCoSine(double dist, double h) {
        double hyp = getHypotenuse(dist, h);
        return dist / hyp;
    }

    double getEfort(double dist, double h){
        double p = m * g;
        double efortFactor = phi * m * g * getCoSine(dist, h);
        double efort = p * getSine(dist, h) + efortFactor;
        return efort;
    }

    double WorkTask (double dist, double sth){
        return dist * sth;
    }
};
Define_Channel(Edge);

#endif
