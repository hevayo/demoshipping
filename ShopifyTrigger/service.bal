import ballerina/http;
import ballerinax/trigger.shopify;

configurable shopify:ListenerConfig config = ?;

listener shopify:Listener webhookListener = new (config);

@display {
    label: "OrdersService",
    id: "OrdersService"
}
service shopify:OrdersService on webhookListener {

    @display {
        label: "shipping",
        id: "shipping-e1ec27f1-249f-49c1-9009-09330c5a02a7"
    }
    http:Client shippingClient;

    function init() returns error? {
        self.shippingClient = check new ("");
    }

    remote function onOrdersCreate(shopify:OrderEvent event) returns error? {
        record {} postResponse = check self.shippingClient->/orders.post(message = ());
    }
    remote function onOrdersCancelled(shopify:OrderEvent event) returns error? {
        // Not Implemented
    }
    remote function onOrdersFulfilled(shopify:OrderEvent event) returns error? {
        // Not Implemented
    }
    remote function onOrdersPaid(shopify:OrderEvent event) returns error? {
        // Not Implemented
    }
    remote function onOrdersPartiallyFulfilled(shopify:OrderEvent event) returns error? {
        // Not Implemented
    }
    remote function onOrdersUpdated(shopify:OrderEvent event) returns error? {
        // Not Implemented
    }
}

