#Wolfram Data Drop
This library wraps the [Wolfram Data Drop](www.wolfram.com/datadrop/) API. Wolfram Data Drop is an open service that makes it easy to accumulate data of any kind, from anywhere—setting it up for immediate computation, visualization, analysis, querying, or other operations.

## constructor(binId)
To create a new Wolfram Data Drop object, you will need the binId of your data drop bin:

```
bin <- WolframDataDrop(binId);
```

## bin.sendEvent(data, [callback])
The **sendEvent** method adds a new datapoint to your bin. If a callback is supplied, the request will be made asyncronously, and the callback will be executed upon completion. If no callback is supplied, the request will be made syncronously, and the method will return an object with two fields: err, and data. Examples of both can be seen below:

```
// Asyncronous Request
device.on("temp", function(data) {

    local dataToSend = {
        ts = data.timestamp,
        temp = data.temp
    };

    // send asyncronously
    bin.sendEvent(dataToSend, function(resp) {
        server.log(resp.statuscode + ": " + resp.body);
    });
});
```

```
// Syncronous Request:
device.on("temp", function(data) {
    local dataToSend = {
        ts = data.timestamp,
        temp = data.temp
    };

    // send syncronously
    bin.sendEvent(dataToSend);
    server.log(resp.statuscode + ": " + resp.body);
});
```

#License
The Wolfram Data Drop library is licensed under the [MIT License](./LICENSE).
