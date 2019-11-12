%%%-------------------------------------------------------------------
%% @doc Behaviour to implement for grpc service opencensus.proto.agent.trace.v1.TraceService.
%% @end
%%%-------------------------------------------------------------------

%% this module was generated on 2019-11-04T12:07:33+00:00 and should not be modified manually

-module(oc_trace_bhvr).

%% @doc 
-callback config(reference(), grpcbox_stream:t()) ->
    ok | grpcbox_stream:grpc_error_response().

%% @doc 
-callback export(reference(), grpcbox_stream:t()) ->
    ok | grpcbox_stream:grpc_error_response().

