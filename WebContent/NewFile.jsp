jQuery(window).on("load", function() {
    $('#preloadpage').addClass('animated slideOutDown');
    $("#preloadpage").fadeOut(2000)
});
var path = location.pathname;
var cur_path = path;
var arr = path.split("/");
var arr1 = arr[1].split("/");
path = "/" + arr1[0];
$(function() {
    loadjscssfile("app-assets/vendors/css/forms/icheck/icheck.css", "css");
    loadjscssfile("app-assets/vendors/css/forms/icheck/custom.css", "css");
    loadjscssfile("app-assets/css/core/menu/menu-types/vertical-menu.css", "css");
    loadjscssfile("app-assets/css/core/colors/palette-gradient.css", "css");
    loadjscssfile("app-assets/css/pages/login-register.css", "css")
});

function loadjscssfile(a, b) {
    if (b == "js") {
        var c = document.createElement("script");
        c.setAttribute("type", "text/javascript");
        c.setAttribute("src", a)
    } else {
        if (b == "css") {
            var c = document.createElement("link");
            c.setAttribute("rel", "stylesheet");
            c.setAttribute("type", "text/css");
            c.setAttribute("href", a)
        }
    }
    if (typeof c != "undefined") {
        document.getElementsByTagName("head")[0].appendChild(c)
    }
}

function getScripts(a) {
    var b = [];
    a.forEach(function(c) {
        (function(d) {
            b.push(new Promise(function(e) {
                $.getScript(d, function() {
                    e()
                })
            }))
        })(c)
    });
    return Promise.all(b, function() {
        return true
    })
}
$(function() {
    var a = [path + "/app-assets/js/aes.js", path + "/app-assets/js/pbkdf2.js", path + "/app-assets/js/AesUtil.js", path + "/app-assets/js/bootbox.min.js", path + "/app-assets/js/core/app.js", path + "/app-assets/js/core/app-menu.js", path + "/app-assets/vendors/js/forms/icheck/icheck.min.js", path + "/app-assets/vendors/js/vendors.min.js"];
    getScripts(a).then(function() {})
});
$(function() {
    if (localStorage.chkbx && localStorage.chkbx != "") {
        $("#remember_me").attr("checked", "checked");
        $("#emailid").val(localStorage.usrname);
        $("#password").val(localStorage.pass)
    } else {
        $("#remember_me").removeAttr("checked");
        $("#emailid").val("");
        $("#password").val("");
        $("#remember_me").click(function() {
            if ($("#remember_me").is(":checked")) {
                localStorage.usrname = $("#emailid").val();
                localStorage.pass = $("#password").val();
                localStorage.chkbx = $("#remember_me").val()
            } else {
                localStorage.usrname = "";
                localStorage.pass = "";
                localStorage.chkbx = ""
            }
        })
    }
});

function getlogin() {
    document.location.href = "/Dashboard.jsp"
}
var path = location.pathname;
var cur_path = path;
var arr = path.split("/");
var arr1 = arr[1].split("/");
path = "/" + arr1[0];
(function() {
    var f = document.getElementById("online-status"),
        d = function() {},
        e = function() {
            document.location.href = path + "/Offline_error.jsp"
        };
    if (window.addEventListener) {
        window.addEventListener("online", d, false);
        window.addEventListener("offline", e, false)
    } else {
        document.body.ononline = d;
        document.body.onoffline = e
    }
})();
(function(d) {
    if (typeof(d) === "undefined") {
        throw new Error("window is undefined")
    }
    var e = "!";
    var f = function() {
        d.location.href += "#";
        d.setTimeout(function() {
            d.location.href += "!"
        }, 50)
    };
    d.onhashchange = function() {
        if (d.location.hash !== e) {
            d.location.hash = e
        }
    };
    d.onload = function() {
        f();
        document.body.onkeydown = function(b) {
            var a = b.target.nodeName.toLowerCase();
            if (b.which === 8 && (a !== "input" && a !== "textarea")) {
                b.preventDefault()
            }
            b.stopPropagation()
        }
    }
})(window);
$(function() {
    $("#btnsave").bind("click", function() {
        $("#Loginvalid").one("submit", function(q) {
            var p = $("#emailid").val();
            if (p == "") {
                return false
            }
            var g = $("#password").val();
            if (g == "") {
                return false
            }
            if (p != "" && g != "") {
                $("#btnsave").attr("disabled", true);
                $("#btnsave").html('<i class="fa fa-refresh"></i> Processing ...');
                var h = $("#Loginvalid").serializeArray();
                var f = $("#Loginvalid").attr("action");
                var a = "10000";
                var e = "128";
                var b = "F27D5C9927726BCEFE7510B1BDD3D137";
                var c = "3FF2EC019C627B945225DEBAD71A01B6985FE84C95A70EB132882F88C0A59A55";
                var d = new AesUtil(e, a);
                var n = "uname#" + p + "-pwd#" + g;
                var n = d.encrypt(c, b, "data", n);
                $.ajax({
                    url: f,
                    type: "POST",
                    data: {
                        req: n
                    },
                    success: function(i) {
                        var j = i.trim();
                        var k = d.decrypt(c, b, "data", j);
                        if (k.trim() == "Success") {
                            window.location.replace(path + "/Dashboard.jsp")
                        } else {
                            if (k.trim() == "Invalid") {
                                bootbox.dialog({
                                    message: "Kindly check your Login Credential!",
                                    buttons: {
                                        danger: {
                                            label: "ok",
                                            className: "btn-primary",
                                            callback: function() {
                                                setTimeout(function() {
                                                    $("#pwd").focus();
                                                    $("#uname").focus();
                                                    $("#login").attr("disabled", false);
                                                    $("#login").html("Sign In")
                                                }, 10)
                                            }
                                        }
                                    }
                                });
                                return false
                            } else {
                                bootbox.dialog({
                                    message: "Invalid Email address and Password",
                                    buttons: {
                                        danger: {
                                            label: "ok",
                                            className: "btn-primary",
                                            callback: function() {
                                                setTimeout(function() {
                                                    $("#pwd").val("");
                                                    $("#uname").val("");
                                                    $("#login").attr("disabled", false);
                                                    $("#login").html("Sign In")
                                                }, 10)
                                            }
                                        }
                                    }
                                });
                                return false
                            }
                        }
                    },
                    error: function(j, i, k) {},
                    complete: function() {
                        $("#btnsave").attr("disabled", false);
                        $("#btnsave").html("Sign In")
                    }
                });
                q.preventDefault()
            } else {}
            q.preventDefault();
            return false
        })
    })
});