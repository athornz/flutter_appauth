var appAuth = function (t) {
    var e = {};

    function r(n) {
        if (e[n]) return e[n].exports;
        var o = e[n] = {i: n, l: !1, exports: {}};
        return t[n].call(o.exports, o, o.exports, r), o.l = !0, o.exports
    }

    return r.m = t, r.c = e, r.d = function (t, e, n) {
        r.o(t, e) || Object.defineProperty(t, e, {enumerable: !0, get: n})
    }, r.r = function (t) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {value: "Module"}), Object.defineProperty(t, "__esModule", {value: !0})
    }, r.t = function (t, e) {
        if (1 & e && (t = r(t)), 8 & e) return t;
        if (4 & e && "object" == typeof t && t && t.__esModule) return t;
        var n = Object.create(null);
        if (r.r(n), Object.defineProperty(n, "default", {
            enumerable: !0,
            value: t
        }), 2 & e && "string" != typeof t) for (var o in t) r.d(n, o, function (e) {
            return t[e]
        }.bind(null, o));
        return n
    }, r.n = function (t) {
        var e = t && t.__esModule ? function () {
            return t.default
        } : function () {
            return t
        };
        return r.d(e, "a", e), e
    }, r.o = function (t, e) {
        return Object.prototype.hasOwnProperty.call(t, e)
    }, r.p = "", r(r.s = 16)
}([function (t, e, r) {
    "use strict";
    Object.defineProperty(e, "__esModule", {value: !0});
    var n = function (t, e) {
        this.message = t, this.extras = e
    };
    e.AppAuthError = n
}, function (t, e, r) {
    "use strict";
    var n = this && this.__spreadArrays || function () {
        for (var t = 0, e = 0, r = arguments.length; e < r; e++) t += arguments[e].length;
        var n = Array(t), o = 0;
        for (e = 0; e < r; e++) for (var i = arguments[e], s = 0, u = i.length; s < u; s++, o++) n[o] = i[s];
        return n
    };
    Object.defineProperty(e, "__esModule", {value: !0});
    var o = r(6);

    function i(t) {
        for (var e = [], r = 1; r < arguments.length; r++) e[r - 1] = arguments[r];
        if (o.IS_LOG) {
            var i = e ? e.length : 0;
            i > 0 ? console.log.apply(console, n([t], e)) : console.log(t)
        }
    }

    e.log = i;
    var s = "undefined" != typeof window && !!window.performance && !!console.profile;
    e.profile = function (t, e, r) {
        return o.IS_PROFILE ? function (t, e, r) {
            var o = r.value, u = o.name;
            u || (u = "anonymous function");
            r.value = s ? function (t) {
                console.profile(u);
                var e = window.performance.now(), r = o.call.apply(o, n([this || window], t)), i = window.performance.now() - e;
                return console.log(u + " took " + i + " ms"), console.profileEnd(), r
            } : function (t) {
                i("Profile start " + u);
                var e = Date.now(), r = o.call.apply(o, n([this || window], t)), s = Date.now() - e;
                return i("Profile end " + u + " took " + s + " ms."), r
            };
            return r
        }(0, 0, r) : r
    }
}, function (t, e, r) {
    "use strict";
    var n, o = this && this.__extends || (n = function (t, e) {
        return (n = Object.setPrototypeOf || {__proto__: []} instanceof Array && function (t, e) {
            t.__proto__ = e
        } || function (t, e) {
            for (var r in e) e.hasOwnProperty(r) && (t[r] = e[r])
        })(t, e)
    }, function (t, e) {
        function r() {
            this.constructor = t
        }

        n(t, e), t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r)
    });
    Object.defineProperty(e, "__esModule", {value: !0});
    var i = r(0), s = function () {
    };
    e.Requestor = s;
    var u = function (t) {
        function e() {
            return null !== t && t.apply(this, arguments) || this
        }

        return o(e, t), e.prototype.xhr = function (t) {
            var e = $.ajax(t);
            return new Promise((function (t, r) {
                e.then((function (e, r, n) {
                    t(e)
                }), (function (t, e, n) {
                    r(new i.AppAuthError(n))
                }))
            }))
        }, e
    }(s);
    e.JQueryRequestor = u;
    var a = function (t) {
        function e() {
            return null !== t && t.apply(this, arguments) || this
        }

        return o(e, t), e.prototype.xhr = function (t) {
            if (!t.url) return Promise.reject(new i.AppAuthError("A URL must be provided."));
            var e = new URL(t.url), r = {};
            (r.method = t.method, r.mode = "cors", t.data) && (t.method && "POST" === t.method.toUpperCase() ? r.body = t.data : new URLSearchParams(t.data).forEach((function (t, r) {
                e.searchParams.append(r, t)
            })));
            if (r.headers = {}, t.headers) for (var n in t.headers) t.headers.hasOwnProperty(n) && (r.headers[n] = t.headers[n]);
            var o = t.dataType && "json" === t.dataType.toLowerCase();
            return o && (r.headers.Accept = "application/json, text/javascript, */*; q=0.01"), fetch(e.toString(), r).then((function (t) {
                if (t.status >= 200 && t.status < 300) {
                    var e = t.headers.get("content-type");
                    return o || e && -1 !== e.indexOf("application/json") ? t.json() : t.text()
                }
                return Promise.reject(new i.AppAuthError(t.status.toString(), t.statusText))
            }))
        }, e
    }(s);
    e.FetchRequestor = a;
    var c = function (t) {
        function e(e) {
            var r = t.call(this) || this;
            return r.promise = e, r
        }

        return o(e, t), e.prototype.xhr = function (t) {
            return this.promise
        }, e
    }(s);
    e.TestRequestor = c
}, function (t, e, r) {
    "use strict";
    Object.defineProperty(e, "__esModule", {value: !0});
    var n = r(17), o = r(0), i = "undefined" != typeof window && !!window.crypto, s = i && !!window.crypto.subtle,
        u = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    function a(t) {
        for (var e = [], r = 0; r < t.byteLength; r += 1) {
            var n = t[r] % u.length;
            e.push(u[n])
        }
        return e.join("")
    }

    function c(t) {
        return n.fromByteArray(new Uint8Array(t)).replace(/\+/g, "-").replace(/\//g, "_").replace(/=/g, "")
    }

    function f(t) {
        for (var e = new ArrayBuffer(t.length), r = new Uint8Array(e), n = 0; n < t.length; n++) r[n] = t.charCodeAt(n);
        return r
    }

    e.bufferToString = a, e.urlSafe = c, e.textEncodeLite = f;
    var p = function () {
        function t() {
        }

        return t.prototype.generateRandom = function (t) {
            var e = new Uint8Array(t);
            if (i) window.crypto.getRandomValues(e); else for (var r = 0; r < t; r += 1) e[r] = Math.random() * u.length | 0;
            return a(e)
        }, t.prototype.deriveChallenge = function (t) {
            return t.length < 43 || t.length > 128 ? Promise.reject(new o.AppAuthError("Invalid code length.")) : s ? new Promise((function (e, r) {
                crypto.subtle.digest("SHA-256", f(t)).then((function (t) {
                    return e(c(new Uint8Array(t)))
                }), (function (t) {
                    return r(t)
                }))
            })) : Promise.reject(new o.AppAuthError("window.crypto.subtle is unavailable."))
        }, t
    }();
    e.DefaultCrypto = p
}, function (t, e, r) {
    "use strict";
    Object.defineProperty(e, "__esModule", {value: !0});
    var n = function () {
        function t() {
        }

        return t.prototype.parse = function (t, e) {
            return e ? this.parseQueryString(t.hash) : this.parseQueryString(t.search)
        }, t.prototype.parseQueryString = function (t) {
            for (var e = {}, r = (t = t.trim().replace(/^(\?|#|&)/, "")).split("&"), n = 0; n < r.length; n += 1) {
                var o = r[n].split("=");
                if (o.length >= 2) {
                    var i = decodeURIComponent(o.shift()), s = o.length > 0 ? o.join("=") : null;
                    s && (e[i] = decodeURIComponent(s))
                }
            }
            return e
        }, t.prototype.stringify = function (t) {
            var e = [];
            for (var r in t) t.hasOwnProperty(r) && t[r] && e.push(encodeURIComponent(r) + "=" + encodeURIComponent(t[r]));
            return e.join("&")
        }, t
    }();
    e.BasicQueryStringUtils = n
}, function (t, e, r) {
    "use strict";
    Object.defineProperty(e, "__esModule", {value: !0});
    var n = r(3), o = r(1), i = function () {
        function t(e, r, o) {
            void 0 === r && (r = new n.DefaultCrypto), void 0 === o && (o = !0), this.crypto = r, this.usePkce = o, this.clientId = e.client_id, this.redirectUri = e.redirect_uri, this.scope = e.scope, this.responseType = e.response_type || t.RESPONSE_TYPE_CODE, this.state = e.state || function (t) {
                return t.generateRandom(10)
            }(r), this.extras = e.extras, this.internal = e.internal
        }

        return t.prototype.setupCodeVerifier = function () {
            var t = this;
            if (this.usePkce) {
                var e = this.crypto.generateRandom(128);
                return this.crypto.deriveChallenge(e).catch((function (t) {
                    o.log("Unable to generate PKCE challenge. Not using PKCE", t)
                })).then((function (r) {
                    r && (t.internal = t.internal || {}, t.internal.code_verifier = e, t.extras = t.extras || {}, t.extras.code_challenge = r, t.extras.code_challenge_method = "S256")
                }))
            }
            return Promise.resolve()
        }, t.prototype.toJson = function () {
            var t = this;
            return this.setupCodeVerifier().then((function () {
                return {
                    response_type: t.responseType,
                    client_id: t.clientId,
                    redirect_uri: t.redirectUri,
                    scope: t.scope,
                    state: t.state,
                    extras: t.extras,
                    internal: t.internal
                }
            }))
        }, t.RESPONSE_TYPE_TOKEN = "token", t.RESPONSE_TYPE_CODE = "code", t
    }();
    e.AuthorizationRequest = i
}, function (t, e, r) {
    "use strict";
    Object.defineProperty(e, "__esModule", {value: !0}), e.IS_LOG = !0, e.IS_PROFILE = !1
}, function (t, e, r) {
    "use strict";
    Object.defineProperty(e, "__esModule", {value: !0});
    var n = r(1), o = function () {
        function t() {
            this.listener = null
        }

        return t.prototype.setAuthorizationListener = function (t) {
            this.listener = t
        }, t.prototype.onAuthorizationComplete = function (t, e, r) {
            this.listener && this.listener(t, e, r)
        }, t
    }();
    e.AuthorizationNotifier = o, e.BUILT_IN_PARAMETERS = ["redirect_uri", "client_id", "response_type", "state", "scope"];
    var i = function () {
        function t(t, e) {
            this.utils = t, this.crypto = e, this.notifier = null
        }

        return t.prototype.buildRequestUrl = function (t, r) {
            var n = {redirect_uri: r.redirectUri, client_id: r.clientId, response_type: r.responseType, state: r.state, scope: r.scope};
            if (r.extras) for (var o in r.extras) r.extras.hasOwnProperty(o) && e.BUILT_IN_PARAMETERS.indexOf(o) < 0 && (n[o] = r.extras[o]);
            var i = this.utils.stringify(n);
            return t.authorizationEndpoint + "?" + i
        }, t.prototype.completeAuthorizationRequestIfPossible = function () {
            var t = this;
            return n.log("Checking to see if there is an authorization response to be delivered."), this.notifier || n.log("Notifier is not present on AuthorizationRequest handler.\n          No delivery of result will be possible"), this.completeAuthorizationRequest().then((function (e) {
                e || n.log("No result is available yet."), e && t.notifier && t.notifier.onAuthorizationComplete(e.request, e.response, e.error)
            }))
        }, t.prototype.setAuthorizationNotifier = function (t) {
            return this.notifier = t, this
        }, t
    }();
    e.AuthorizationRequestHandler = i
}, function (t, e, r) {
    "use strict";
    Object.defineProperty(e, "__esModule", {value: !0});
    var n = function () {
        function t(t) {
            this.code = t.code, this.state = t.state
        }

        return t.prototype.toJson = function () {
            return {code: this.code, state: this.state}
        }, t
    }();
    e.AuthorizationResponse = n;
    var o = function () {
        function t(t) {
            this.error = t.error, this.errorDescription = t.error_description, this.errorUri = t.error_uri, this.state = t.state
        }

        return t.prototype.toJson = function () {
            return {error: this.error, error_description: this.errorDescription, error_uri: this.errorUri, state: this.state}
        }, t
    }();
    e.AuthorizationError = o
}, function (t, e, r) {
    "use strict";
    var n, o = this && this.__extends || (n = function (t, e) {
        return (n = Object.setPrototypeOf || {__proto__: []} instanceof Array && function (t, e) {
            t.__proto__ = e
        } || function (t, e) {
            for (var r in e) e.hasOwnProperty(r) && (t[r] = e[r])
        })(t, e)
    }, function (t, e) {
        function r() {
            this.constructor = t
        }

        n(t, e), t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r)
    });
    Object.defineProperty(e, "__esModule", {value: !0});
    var i = function () {
    };
    e.StorageBackend = i;
    var s = function (t) {
        function e(e) {
            var r = t.call(this) || this;
            return r.storage = e || window.localStorage, r
        }

        return o(e, t), e.prototype.getItem = function (t) {
            var e = this;
            return new Promise((function (r, n) {
                var o = e.storage.getItem(t);
                r(o || null)
            }))
        }, e.prototype.removeItem = function (t) {
            var e = this;
            return new Promise((function (r, n) {
                e.storage.removeItem(t), r()
            }))
        }, e.prototype.clear = function () {
            var t = this;
            return new Promise((function (e, r) {
                t.storage.clear(), e()
            }))
        }, e.prototype.setItem = function (t, e) {
            var r = this;
            return new Promise((function (n, o) {
                r.storage.setItem(t, e), n()
            }))
        }, e
    }(i);
    e.LocalStorageBackend = s
}, function (t, e, r) {
    "use strict";
    Object.defineProperty(e, "__esModule", {value: !0});
    e.nowInSeconds = function () {
        return Math.round((new Date).getTime() / 1e3)
    };
    var n = function () {
        function t(t) {
            this.accessToken = t.access_token, this.tokenType = t.token_type || "bearer", this.expiresIn = t.expires_in, this.refreshToken = t.refresh_token, this.scope = t.scope, this.idToken = t.id_token, this.issuedAt = t.issued_at || e.nowInSeconds()
        }

        return t.prototype.toJson = function () {
            return {
                access_token: this.accessToken,
                id_token: this.idToken,
                refresh_token: this.refreshToken,
                scope: this.scope,
                token_type: this.tokenType,
                issued_at: this.issuedAt,
                expires_in: this.expiresIn
            }
        }, t.prototype.isValid = function (t) {
            return void 0 === t && (t = -600), !this.expiresIn || e.nowInSeconds() < this.issuedAt + this.expiresIn + t
        }, t
    }();
    e.TokenResponse = n;
    var o = function () {
        function t(t) {
            this.error = t.error, this.errorDescription = t.error_description, this.errorUri = t.error_uri
        }

        return t.prototype.toJson = function () {
            return {error: this.error, error_description: this.errorDescription, error_uri: this.errorUri}
        }, t
    }();
    e.TokenError = o
}, function (t, e, r) {
    "use strict";
    Object.defineProperty(e, "__esModule", {value: !0});
    var n = r(2), o = function () {
        function t(t) {
            this.authorizationEndpoint = t.authorization_endpoint, this.tokenEndpoint = t.token_endpoint, this.revocationEndpoint = t.revocation_endpoint, this.userInfoEndpoint = t.userinfo_endpoint, this.endSessionEndpoint = t.end_session_endpoint
        }

        return t.prototype.toJson = function () {
            return {
                authorization_endpoint: this.authorizationEndpoint,
                token_endpoint: this.tokenEndpoint,
                revocation_endpoint: this.revocationEndpoint,
                end_session_endpoint: this.endSessionEndpoint,
                userinfo_endpoint: this.userInfoEndpoint
            }
        }, t.fetchFromIssuer = function (e, r) {
            var o = e + "/.well-known/openid-configuration";
            return (r || new n.JQueryRequestor).xhr({url: o, dataType: "json", method: "GET"}).then((function (e) {
                return new t(e)
            }))
        }, t
    }();
    e.AuthorizationServiceConfiguration = o
}, function (t, e, r) {
    "use strict";
    var n, o = this && this.__extends || (n = function (t, e) {
        return (n = Object.setPrototypeOf || {__proto__: []} instanceof Array && function (t, e) {
            t.__proto__ = e
        } || function (t, e) {
            for (var r in e) e.hasOwnProperty(r) && (t[r] = e[r])
        })(t, e)
    }, function (t, e) {
        function r() {
            this.constructor = t
        }

        n(t, e), t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r)
    });
    Object.defineProperty(e, "__esModule", {value: !0});
    var i = r(5), s = r(7), u = r(8), a = r(3), c = r(1), f = r(4), p = r(9), h = function (t) {
        return t + "_appauth_authorization_request"
    }, d = function (t) {
        return t + "_appauth_authorization_service_configuration"
    }, l = function (t) {
        function e(e, r, n, o) {
            void 0 === e && (e = new p.LocalStorageBackend), void 0 === r && (r = new f.BasicQueryStringUtils), void 0 === n && (n = window.location), void 0 === o && (o = new a.DefaultCrypto);
            var i = t.call(this, r, o) || this;
            return i.storageBackend = e, i.locationLike = n, i
        }

        return o(e, t), e.prototype.performAuthorizationRequest = function (t, e) {
            var r = this, n = this.crypto.generateRandom(10);
            Promise.all([this.storageBackend.setItem("appauth_current_authorization_request", n), e.toJson().then((function (t) {
                return r.storageBackend.setItem(h(n), JSON.stringify(t))
            })), this.storageBackend.setItem(d(n), JSON.stringify(t.toJson()))]).then((function () {
                var n = r.buildRequestUrl(t, e);
                c.log("Making a request to ", e, n), r.locationLike.assign(n)
            }))
        }, e.prototype.completeAuthorizationRequest = function () {
            var t = this;
            return this.storageBackend.getItem("appauth_current_authorization_request").then((function (e) {
                return e ? t.storageBackend.getItem(h(e)).then((function (t) {
                    return JSON.parse(t)
                })).then((function (t) {
                    return new i.AuthorizationRequest(t)
                })).then((function (r) {
                    var n = "" + t.locationLike.origin + t.locationLike.pathname, o = t.utils.parse(t.locationLike, !0), i = o.state, s = o.code,
                        a = o.error;
                    c.log("Potential authorization request ", n, o, i, s, a);
                    var f = i === r.state, p = null, l = null;
                    if (f) {
                        if (a) {
                            var v = o.error_uri, _ = o.error_description;
                            l = new u.AuthorizationError({error: a, error_description: _, error_uri: v, state: i})
                        } else p = new u.AuthorizationResponse({code: s, state: i});
                        return Promise.all([t.storageBackend.removeItem("appauth_current_authorization_request"), t.storageBackend.removeItem(h(e)), t.storageBackend.removeItem(d(e))]).then((function () {
                            return c.log("Delivering authorization response"), {request: r, response: p, error: l}
                        }))
                    }
                    return c.log("Mismatched request (state and request_uri) dont match."), Promise.resolve(null)
                })) : null
            }))
        }, e
    }(s.AuthorizationRequestHandler);
    e.RedirectRequestHandler = l
}, function (t, e, r) {
    "use strict";
    Object.defineProperty(e, "__esModule", {value: !0});
    var n = function () {
        function t(t) {
            this.token = t.token, this.tokenTypeHint = t.token_type_hint, this.clientId = t.client_id, this.clientSecret = t.client_secret
        }

        return t.prototype.toJson = function () {
            var t = {token: this.token};
            return this.tokenTypeHint && (t.token_type_hint = this.tokenTypeHint), this.clientId && (t.client_id = this.clientId), this.clientSecret && (t.client_secret = this.clientSecret), t
        }, t.prototype.toStringMap = function () {
            return this.toJson()
        }, t
    }();
    e.RevokeTokenRequest = n
}, function (t, e, r) {
    "use strict";
    Object.defineProperty(e, "__esModule", {value: !0}), e.GRANT_TYPE_AUTHORIZATION_CODE = "authorization_code", e.GRANT_TYPE_REFRESH_TOKEN = "refresh_token";
    var n = function () {
        function t(t) {
            this.clientId = t.client_id, this.redirectUri = t.redirect_uri, this.grantType = t.grant_type, this.code = t.code, this.refreshToken = t.refresh_token, this.extras = t.extras
        }

        return t.prototype.toJson = function () {
            return {
                grant_type: this.grantType,
                code: this.code,
                refresh_token: this.refreshToken,
                redirect_uri: this.redirectUri,
                client_id: this.clientId,
                extras: this.extras
            }
        }, t.prototype.toStringMap = function () {
            var t = {grant_type: this.grantType, client_id: this.clientId, redirect_uri: this.redirectUri};
            if (this.code && (t.code = this.code), this.refreshToken && (t.refresh_token = this.refreshToken), this.extras) for (var e in this.extras) this.extras.hasOwnProperty(e) && !t.hasOwnProperty(e) && (t[e] = this.extras[e]);
            return t
        }, t
    }();
    e.TokenRequest = n
}, function (t, e, r) {
    "use strict";
    Object.defineProperty(e, "__esModule", {value: !0});
    var n = r(0), o = r(4), i = r(10), s = r(2), u = function () {
        function t(t, e) {
            void 0 === t && (t = new s.JQueryRequestor), void 0 === e && (e = new o.BasicQueryStringUtils), this.requestor = t, this.utils = e
        }

        return t.prototype.isTokenResponse = function (t) {
            return void 0 === t.error
        }, t.prototype.performRevokeTokenRequest = function (t, e) {
            return this.requestor.xhr({
                url: t.revocationEndpoint,
                method: "POST",
                headers: {"Content-Type": "application/x-www-form-urlencoded"},
                data: this.utils.stringify(e.toStringMap())
            }).then((function (t) {
                return !0
            }))
        }, t.prototype.performTokenRequest = function (t, e) {
            var r = this;
            return this.requestor.xhr({
                url: t.tokenEndpoint,
                method: "POST",
                dataType: "json",
                headers: {"Content-Type": "application/x-www-form-urlencoded"},
                data: this.utils.stringify(e.toStringMap())
            }).then((function (t) {
                return r.isTokenResponse(t) ? new i.TokenResponse(t) : Promise.reject(new n.AppAuthError(t.error, new i.TokenError(t)))
            }))
        }, t
    }();
    e.BaseTokenRequestHandler = u
}, function (t, e, r) {
    "use strict";
    r.r(e);
    var n = r(11);
    for (var o in n) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return n[t]
        }))
    }(o);
    var i = r(5);
    for (var o in i) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return i[t]
        }))
    }(o);
    var s = r(7);
    for (var o in s) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return s[t]
        }))
    }(o);
    var u = r(8);
    for (var o in u) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return u[t]
        }))
    }(o);
    var a = r(3);
    for (var o in a) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return a[t]
        }))
    }(o);
    var c = r(0);
    for (var o in c) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return c[t]
        }))
    }(o);
    var f = r(6);
    for (var o in f) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return f[t]
        }))
    }(o);
    var p = r(1);
    for (var o in p) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return p[t]
        }))
    }(o);
    var h = r(4);
    for (var o in h) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return h[t]
        }))
    }(o);
    var d = r(12);
    for (var o in d) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return d[t]
        }))
    }(o);
    var l = r(13);
    for (var o in l) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return l[t]
        }))
    }(o);
    var v = r(9);
    for (var o in v) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return v[t]
        }))
    }(o);
    var _ = r(14);
    for (var o in _) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return _[t]
        }))
    }(o);
    var y = r(15);
    for (var o in y) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return y[t]
        }))
    }(o);
    var g = r(10);
    for (var o in g) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return g[t]
        }))
    }(o);
    var m = r(2);
    for (var o in m) "default" !== o && function (t) {
        r.d(e, t, (function () {
            return m[t]
        }))
    }(o)
}, function (t, e, r) {
    "use strict";
    e.byteLength = function (t) {
        var e = c(t), r = e[0], n = e[1];
        return 3 * (r + n) / 4 - n
    }, e.toByteArray = function (t) {
        var e, r, n = c(t), s = n[0], u = n[1], a = new i(function (t, e, r) {
            return 3 * (e + r) / 4 - r
        }(0, s, u)), f = 0, p = u > 0 ? s - 4 : s;
        for (r = 0; r < p; r += 4) e = o[t.charCodeAt(r)] << 18 | o[t.charCodeAt(r + 1)] << 12 | o[t.charCodeAt(r + 2)] << 6 | o[t.charCodeAt(r + 3)], a[f++] = e >> 16 & 255, a[f++] = e >> 8 & 255, a[f++] = 255 & e;
        2 === u && (e = o[t.charCodeAt(r)] << 2 | o[t.charCodeAt(r + 1)] >> 4, a[f++] = 255 & e);
        1 === u && (e = o[t.charCodeAt(r)] << 10 | o[t.charCodeAt(r + 1)] << 4 | o[t.charCodeAt(r + 2)] >> 2, a[f++] = e >> 8 & 255, a[f++] = 255 & e);
        return a
    }, e.fromByteArray = function (t) {
        for (var e, r = t.length, o = r % 3, i = [], s = 0, u = r - o; s < u; s += 16383) i.push(f(t, s, s + 16383 > u ? u : s + 16383));
        1 === o ? (e = t[r - 1], i.push(n[e >> 2] + n[e << 4 & 63] + "==")) : 2 === o && (e = (t[r - 2] << 8) + t[r - 1], i.push(n[e >> 10] + n[e >> 4 & 63] + n[e << 2 & 63] + "="));
        return i.join("")
    };
    for (var n = [], o = [], i = "undefined" != typeof Uint8Array ? Uint8Array : Array, s = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", u = 0, a = s.length; u < a; ++u) n[u] = s[u], o[s.charCodeAt(u)] = u;

    function c(t) {
        var e = t.length;
        if (e % 4 > 0) throw new Error("Invalid string. Length must be a multiple of 4");
        var r = t.indexOf("=");
        return -1 === r && (r = e), [r, r === e ? 0 : 4 - r % 4]
    }

    function f(t, e, r) {
        for (var o, i, s = [], u = e; u < r; u += 3) o = (t[u] << 16 & 16711680) + (t[u + 1] << 8 & 65280) + (255 & t[u + 2]), s.push(n[(i = o) >> 18 & 63] + n[i >> 12 & 63] + n[i >> 6 & 63] + n[63 & i]);
        return s.join("")
    }

    o["-".charCodeAt(0)] = 62, o["_".charCodeAt(0)] = 63
}]);