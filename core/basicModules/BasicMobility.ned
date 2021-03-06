package org.mf2.core.basicModules;

//***************************************************************************
// * file:        BasicMobility.ned
// *
// * author:      Daniel Willkomm
// *
// * copyright:   (C) 2004 Telecommunication Networks Group (TKN) at
// *              Technische Universitaet Berlin, Germany.
// *
// *              This program is free software; you can redistribute it 
// *              and/or modify it under the terms of the GNU General Public 
// *              License as published by the Free Software Foundation; either
// *              version 2 of the License, or (at your option) any later 
// *              version.
// *              For further information see file COPYING 
// *              in the top level directory
// ***************************************************************************
// * part of:     framework implementation developed by tkn
// * description: Basic module for all mobility modules
// **************************************************************************/


// Basic module for all mobility modules.
//
// The basic module mainly provides the interfaces with the
// ChannelControl module and functions to update the graphical user
// interface.
//
// It does not provide mobility at all, so you can use it if you only
// want to simulate static networks.
//
// BasicMobility provides random placement of hosts and display
// updates as well as registering with the ChannelControl module. 
//
// Additionally complete border handling is implemented in BasicMobility.
//
// @see ChannelControl
// @author Daniel Willkomm
moduleinterface IBasicMobility
{
    parameters:
        bool coreDebug; // debug switch for the core framework
//        double x; // x coordinate of the nodes' position (-1 = random)
//        double y; // y coordinate of the nodes' position (-1 = random)
}

simple BasicMobility like IBasicMobility
{
    parameters:
        bool coreDebug = default(false); // debug switch for the core framework
        double x; // x coordinate of the nodes' position (-1 = random)
        double y; // y coordinate of the nodes' position (-1 = random)
        @display("i=block/broadcast");
}
