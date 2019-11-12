-module(oc_reporter_kafka_client).

-export([start_link/4,
         report_spans/4]).

-ifdef(OTP_RELEASE).
-include_lib("kernel/include/logger.hrl").
-else.
-define(LOG_INFO(Format, Args), error_logger:info_msg(Format, Args)).
-define(LOG_ERROR(Format, Args), error_logger:error_msg(Format, Args)).
-endif.

start_link(Endpoints, Topic, ClientId, ProducerConfig) ->
    ok = brod:start_client(Endpoints, ClientId),
    ok = brod:start_producer(ClientId, Topic, ProducerConfig),
    {ok, []}.

report_spans(Spans, ClientId, Topic, Partitioner) ->
    [FirstSpan|_rest] = Spans,
    TraceId = maps:get(trace_id,FirstSpan),
    Encoded = dump_pb:encode_msg(#{spans => Spans}, dump_spans),
    {ok, _FirstOffset} = brod:produce_sync_offset(ClientId, Topic, Partitioner, TraceId, Encoded).