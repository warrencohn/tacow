// Generated by the WOLips Templateengine Plug-in at Apr 7, 2006 11:21:38 AM

import com.webobjects.appserver.*;

public class DirectAction extends WODirectAction {

    public DirectAction(WORequest aRequest) {
        super(aRequest);
    }

    public WOActionResults defaultAction() {
        return pageWithName(Main.class.getName());
    }

}