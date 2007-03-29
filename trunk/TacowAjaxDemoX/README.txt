Hey all,

Thanks for downloading the project and looking at the source :-)

This is an Xcode version of the demo app I showed at the first tacow
meeting Aprill 11, 2006 at Apple's Markham Sales Centre.

The project contains a couple of components that demonstrate using the
Ajax.framework - and in particular the AjaxProxy component - to enable
server <-> browser communication via JSON-RPC.

As I mentioned in the presentation, this demo wouldn't have been
possible without a lot of work by some very smart people (who aren't
me).

To begin, with Jean-François Veillette did the initiall work
wrapping Metaparadigm's JSON-RPC-Java implementation[1] with WebObjects
goodness. His work is available on WOCode[2].

Anjo Krank then integrated the Jean--François' frameworks into
ProjectWONDER[3] and updated them to work with a modern IDE[4].

Although the Ajax.framework is now part of ProjectWONDER, it doesn't
have a lot of dependencies on the rest of the Wonder frameworks, so
please don't let that stop you from playing with it. As a minimum you
will need the ERJars.framework installed (although just having the log4j
jars in your class path may do).

Currently the best place to get a hold of the ProjectWONDER frameworks
is at the nightly build server[5] maintained by Mike Schrag.

The two demo compoents are SimpleDemo, which just sends a meassage the
server and displays a javascript alert dialog with the response, and
ColourPickerDemo which implements a three slider colour picker that
round-trips changes to the server.

To clarify, these are demo implementations only, for instance - I
wouldn't recommend creating a colour picker this way. It sould be much
better to cache the values and only communicate with the server on
changes.

I also recommend downloading the Ajax.framework source and reading
Jean-François comments to get an understanding of how to fully use the
AjaxProxy component.

[1] http://oss.metaparadigm.com/jsonrpc/
[2] http://wocode.com/cgi-bin/WebObjects/WOCode.woa/1/wa/ShareCodeItem?itemId=45
[3] http://wonder.sourceforge.net/
[4] http://www.eclipse.org/
[5] http://www.mdimension.com/~wonder/

For the impatient amoung you here is the short version:

Include an AjaxProxy component in your WOComponent (We will call it
"Proxy").

It's .wod entry should look like this:

Proxy :  AjaxProxy { 
	proxyName = "wopage"; 
	name = "jsonrpc"; 
}

In your Java file create the method you're going to communicate with:

public void sayHello(String value) { 
	NSLog.out.appendln(value); 
}

Finally, add the javascript to the component that is going to do the
communicating. ie: Create a WOHyperlink and bind the href binding to:


"javascript:jsonrpc.wopage.sayHello('Hello');"

