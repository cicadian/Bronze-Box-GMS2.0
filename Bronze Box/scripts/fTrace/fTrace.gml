// https://yal.cc/gamemaker-trace-function/
/// @func fTrace
/// @desc {void} easy to use debug messaging
/// @arg {any ...}
var r = string(argument[0]);
for (var i = 1; i < argument_count; i++) {
    r += ", " + string(argument[i]);
}
show_debug_message(r);
