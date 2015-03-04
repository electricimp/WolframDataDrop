class WolframDataDrop {
    static _baseUrl = "https://datadrop.wolframcloud.com/api/v1.0/Add";

    _bin = null;

    constructor(bin) {
        this._bin = bin;
    }

    function sendEvent(data, cb = null) {
        local headers = {
            "Content-Type": "application/x-www-form-urlencoded"
        }
        local authData = { Bin = _bin }

        local encodedAuthData = http.urlencode(authData);
        local encodedData = http.urlencode(data);

        local requestUrl = format("%s?%s", _baseUrl, encodedAuthData);
        local request = http.post(requestUrl, headers, encodedData);
        if (cb == null) return request.sendsync();

        return request.sendasync(cb);
    }
}

