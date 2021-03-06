package org.mf2.contrib.nic;
//***************************************************************************
//* file:        P2PNic.ned
//*
//* author:      Daniel Willkomm
//*
//* copyright:   (C) 2004 Telecommunication Networks Group (TKN) at
//*              Technische Universitaet Berlin, Germany.
//*
//*              This program is free software; you can redistribute it 
//*              and/or modify it under the terms of the GNU General Public 
//*              License as published by the Free Software Foundation; either
//*              version 2 of the License, or (at your option) any later 
//*              version.
//*              For further information see file COPYING 
//*              in the top level directory
//***************************************************************************
//* part of:     framework implementation developed by tkn
//* description:  basic network interace card Compound Module
//*
//***************************************************************************
//* changelog:   $Revision: 285 $
//*              last modified:   $Date: 2006-06-07 18:20:31 +0200 (Mi, 07 Jun 2006) $
//*              by:              $Author: willkomm $
//***************************************************************************

import org.mf2.contrib.nic.macLayer.AlohaMacLayer;
import org.mf2.contrib.nic.phyLayer.P2PPhyLayer;
import org.mf2.contrib.nic.radios.SingleChannelRadio;


// The nic (network interface card) is a compound module that contains the 
// MAC and PHY of a host within the Mobility Framework
//
// The P2P nic only contains a simple phy layer which provides no snr 
// evaluation but simple sends unicast messages and calculates the bit errors
// based on a bit error probability provided in omnetpp.ini
//
// IMPORTANT:<br> In order to work with our ChannelControl module the phy 
// module has to be called "phy" in the ned file.
//
// @author Daniel Willkomm
module P2PNic
{
    parameters:
        @display("bgb=190,174,white;bgp=10,10;i=block/ifcard");
    gates:
        input uppergateIn; // to upper layers
        output upperControlOut; // control to upper layers
        output uppergateOut; // from upper layers
        input radioIn; //gate for sendDirect

    submodules:
        mac: AlohaMacLayer {
            parameters:
                @display("b=32,30;p=60,50;i=prot2");
        }
        phy: P2PPhyLayer {
            parameters:
                @display("b=32,30;p=60,115;i=prot3");
        }
        radio: SingleChannelRadio {
            parameters:
                @display("p=130,50");

        }
    connections:
        phy.uppergateIn <-- mac.lowergateOut;
        phy.uppergateOut --> mac.lowergateIn;
        phy.upperControlOut --> mac.lowerControlIn;

        mac.uppergateOut --> uppergateOut;
        mac.upperControlOut --> upperControlOut;
        mac.uppergateIn <-- uppergateIn;

        radioIn --> phy.radioIn;

}

