# Wolfram Data Drop

This library wraps the [Wolfram Data Drop](www.wolfram.com/datadrop/) API. Wolfram Data Drop is an open service that makes it easy to accumulate data of any kind, from anywhere—setting it up for immediate computation, visualization, analysis, querying, or other operations.

**To add this library to your project, add** `#require "WolframDataDrop.class.nut:1.0.0"` **to the top of your agent code**

## Class Usage

### Constructor

To instantiate a new Wolfram Data Drop object, you will need the *binId* of your data drop bin to pass into the constructor:

```squirrel
bin <- WolframDataDrop(binId)
```

### Class Methods

### bin.sendEvent(*data, [callback]*)

The **sendEvent** method adds a new datapoint to your bin. If a callback function is supplied, the request will be made asynchronously and the callback will be executed upon completion. If no callback is supplied, the request will be made synchronously, and the method will return a Squirrel table with three fields: *statuscode*, *headers* and *body*. The *body* is itself a table; it has two fields: *err* and *data*.

Examples of both uses of this method can be seen below:

```squirrel
// Asynchronous Request

device.on("temp", function(data) {
    local dataToSend = 
    {
        ts = data.timestamp,
        temp = data.temp
    }

    // Send asynchronously
    
    bin.sendEvent(dataToSend, function(response) {
        server.log(response.statuscode + ": " + response.body);
    })
})
```

```squirrel
// Synchronous Request

device.on("temp", function(data) {
    local dataToSend = 
    {
        ts = data.timestamp,
        temp = data.temp
    }

    // Send synchronously
    
    local response = bin.sendEvent(dataToSend)
    server.log(response.statuscode + ": " + response.body);
})
```

## License

The Wolfram Data Drop library is licensed under the [MIT License](./LICENSE).
