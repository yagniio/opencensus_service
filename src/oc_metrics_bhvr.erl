%%%-------------------------------------------------------------------
%% @doc Behaviour to implement for grpc service opencensus.proto.agent.metrics.v1.MetricsService.
%% @end
%%%-------------------------------------------------------------------

%% this module was generated on 2019-11-04T12:07:35+00:00 and should not be modified manually

-module(oc_metrics_bhvr).

%% @doc 
-callback export(reference(), grpcbox_stream:t()) ->
    ok | grpcbox_stream:grpc_error_response().

