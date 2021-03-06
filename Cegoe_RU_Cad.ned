network Cegoe_RU_Cad
{
    parameters:
        int nnodes = default(11);
    submodules:
        source: Source;
        sink: Sink;
        nodes[nnodes]: Node;
    connections:
        source.out++ --> Edge {  distance = 25.60; height = 0; } --> nodes[0].in++;
        nodes[0].out++ --> Edge {  distance = 48.92; height = 0;  } --> nodes[1].in++;
        nodes[1].out++ --> Edge {  distance = 81.54;  height = 0;  } --> nodes[2].in++;
        nodes[2].out++ --> Edge {  distance = 22.39;  height = 1; @display("ls=yellow");  } --> nodes[3].in++;
        nodes[3].out++ --> Edge {  distance = 104.53;  height = 1; @display("ls=yellow"); } --> nodes[4].in++;
        nodes[4].out++ --> Edge {  distance = 63.02;  height = 4; @display("ls=red");  } --> nodes[5].in++;
        nodes[5].out++ --> Edge {  distance = 88.56; height = 0;  } --> nodes[6].in++;
        nodes[6].out++ --> Edge {  distance = 64.72;  height = 3; @display("ls=red");  } --> nodes[7].in++;
        nodes[7].out++ --> Edge {  distance = 55.26; height = 3; @display("ls=red");   } --> nodes[8].in++;
        nodes[8].out++ --> Edge {  distance = 50.85;  height = 1; @display("ls=yellow");  } --> nodes[9].in++;
        nodes[9].out++ --> Edge {  distance = 42.40; height = 0;  } --> nodes[10].in++;
        nodes[10].out++ --> Edge {  distance = 29.21; height = 0;  } --> sink.in++;
    
}