network Cegoe_BC_Cad_Ater
{
    parameters:
        int nnodes = default(7);
    submodules:
        source: Source;
        sink: Sink;
        nodes[nnodes]: Node;
    connections:
        source.out++ --> Edge {  distance = 27.40; height = 0; } --> nodes[0].in++;
        nodes[0].out++ --> Edge {  distance = 51.52; height = 1; @display("ls=yellow");  } --> nodes[1].in++;
        nodes[1].out++ --> Edge {  distance = 92.61;  height = 0;  } --> nodes[2].in++;
        nodes[2].out++ --> Edge {  distance = 80.76;  height = 1; @display("ls=yellow");  } --> nodes[3].in++;
        nodes[3].out++ --> Edge {  distance = 234.45;  height = 0; } --> nodes[4].in++;
        nodes[4].out++ --> Edge {  distance = 52.08; height = 1; @display("ls=yellow");  } --> nodes[5].in++;
        nodes[5].out++ --> Edge {  distance = 33.52;  height = 1; @display("ls=yellow");  } --> nodes[6].in++;
        nodes[6].out++ --> Edge {  distance = 24.63; height = 1; @display("ls=yellow"); } --> sink.in++;
    
}