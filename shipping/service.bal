import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "shipping",
    id: "shipping-e1ec27f1-249f-49c1-9009-09330c5a02a7"
}
service / on new http:Listener(9090) {
    @display {
        label: "mysql",
        id: "mysql-1860695e-7469-42db-aa8c-8fe5c35f06d4"
    }
    mysql:Client mysqlEp;

    @display {
        label: "Tracking",
        id: "Tracking-23bfb266-bdc0-4222-888e-3d8fe1a17472"
    }
    http:Client trackingClient;

    function init() returns error? {
        self.mysqlEp = check new ();
        self.trackingClient = check new ("");
    }

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get orders(string query) returns string|error {
        // Send a response back to the caller.
        return "Hello, ";
    }

    resource function post orders(@http:Payload Order payload) returns error?|Order {

    }
}

type Order record {
};
