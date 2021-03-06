network Cegoe_RU_Gen_User
{
    parameters:
        int nnodes = default(6);
    submodules:
        source: Source;
        sink: Sink;
        nodes[nnodes]: Node;
    connections:
        source.out++ --> Edge {  distance = 24.05; height = 0; } --> nodes[0].in++;
        nodes[0].out++ --> Edge {  distance = 55.95; height = 0;  } --> nodes[1].in++;
        nodes[1].out++ --> Edge {  distance = 86.83;  height = 0;  } --> nodes[2].in++;
        nodes[2].out++ --> Edge {  distance = 108.48;  height = 1; @display("ls=yellow");  } --> nodes[3].in++;
        nodes[3].out++ --> Edge {  distance = 88.46;  height = 2; @display("ls=yellow");  } --> nodes[4].in++;
        nodes[4].out++ --> Edge {  distance = 16.53;  height = 4; @display("ls=red");  } --> nodes[5].in++;
        nodes[5].out++ --> Edge {  distance = 73.01; height = 0;  } --> sink.in++;
    
}

