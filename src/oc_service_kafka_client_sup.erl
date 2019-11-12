%%%-------------------------------------------------------------------
%% @doc
%% @end
%%%-------------------------------------------------------------------

-module(oc_service_kafka_client_sup).

-behaviour(supervisor).

-export([start_link/5]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link(Endpoints, Topic, ClientId, ProducerConfig, SupFlags) ->
    supervisor:start_link(?MODULE, [Endpoints, Topic, ClientId, ProducerConfig, SupFlags]).

init([Endpoints, Topic, ClientId, ProducerConfig, SupFlags]) ->
    ClientSpec = #{id => oc_reporter_kafka_client,
                   start => {oc_reporter_kafka_client, start_link, [Endpoints, Topic, ClientId, ProducerConfig]}},
    {ok, {SupFlags, [ClientSpec]}}.
