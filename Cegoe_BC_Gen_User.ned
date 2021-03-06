network Cegoe_BC_Gen_User
{
    parameters:
        int nnodes = default(7);
    submodules:
        source: Source;
        sink: Sink;
        nodes[nnodes]: Node;
    connections:
        source.out++ --> Edge {  distance = 26.73; height = 0; } --> nodes[0].in++;
        nodes[0].out++ --> Edge {  distance = 54.86; height = 1; @display("ls=yellow"); } --> nodes[1].in++;
        nodes[1].out++ --> Edge {  distance = 90.92;  height = 0;  } --> nodes[2].in++;
        nodes[2].out++ --> Edge {  distance = 102.56;  height = 2; @display("ls=yellow");  } --> nodes[3].in++;
        nodes[3].out++ --> Edge {  distance = 92.58;  height = 4; @display("ls=red"); } --> nodes[4].in++;
        nodes[4].out++ --> Edge {  distance = 58.81;  height = 0; } --> nodes[5].in++;
        nodes[5].out++ --> Edge {  distance = 136.86; height = 3;  @display("ls=yellow");   } --> nodes[6].in++;
        nodes[6].out++ --> Edge {  distance = 33.02; height = 1;  @display("ls=yellow");  } --> sink.in++;
    
}