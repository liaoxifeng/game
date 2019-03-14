%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 4.4.0

-ifndef(pt_common).
-define(pt_common, true).

-define(pt_common_gpb_version, "4.4.0").

-ifndef('PERSON_PB_H').
-define('PERSON_PB_H', true).
-record('Person',
        {name                   :: iolist(),        % = 1
         id                     :: integer(),       % = 2, 32 bits
         nums = []              :: [pt_common:'Struct_Num'()] | undefined, % = 3
         email                  :: iolist() | undefined % = 4
        }).
-endif.

-ifndef('STRUCT_NUM_PB_H').
-define('STRUCT_NUM_PB_H', true).
-record('Struct_Num',
        {num                    :: non_neg_integer() % = 1, 32 bits
        }).
-endif.

-ifndef('C2S_HEARTBEAT_PB_H').
-define('C2S_HEARTBEAT_PB_H', true).
-record('C2S_Heartbeat',
        {
        }).
-endif.

-ifndef('S2C_HEARTBEAT_PB_H').
-define('S2C_HEARTBEAT_PB_H', true).
-record('S2C_Heartbeat',
        {
        }).
-endif.

-endif.
