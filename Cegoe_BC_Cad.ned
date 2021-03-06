network Cegoe_BC_Cad
{
    parameters:
        int nnodes = default(10);
    submodules:
        source: Source;
        sink: Sink;
        nodes[nnodes]: Node;
    connections:
        source.out++ --> Edge {  distance = 28.88; height = 0; } --> nodes[0].in++;
        nodes[0].out++ --> Edge {  distance = 50.75; height = 0;  } --> nodes[1].in++;
        nodes[1].out++ --> Edge {  distance = 74.57;  height = 0;  } --> nodes[2].in++;
        nodes[2].out++ --> Edge {  distance = 107.53;  height = 0; @display("ls=yellow");  } --> nodes[3].in++;
        nodes[3].out++ --> Edge {  distance = 136.65;  height = 1; @display("ls=yellow"); } --> nodes[4].in++;
        nodes[4].out++ --> Edge {  distance = 60.67;  height = 0; @display("ls=red");  } --> nodes[5].in++;
        nodes[5].out++ --> Edge {  distance = 42.73; height = 1;  } --> nodes[6].in++;
        nodes[6].out++ --> Edge {  distance = 37.82;  height = 0; @display("ls=red");  } --> nodes[7].in++;
        nodes[7].out++ --> Edge {  distance = 89.22; height = 1; @display("ls=red");   } --> nodes[8].in++;
        nodes[8].out++ --> Edge {  distance = 39.36;  height = 1; @display("ls=yellow");  } --> nodes[9].in++;
        nodes[9].out++ --> Edge {  distance = 36.01; height = 1;  } --> sink.in++;
    
}