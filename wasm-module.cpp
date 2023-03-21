#include <emscripten/bind.h>

using namespace emscripten;

int say_hello() {
    printf("Hello from your wasm module\n");
    return 0;
}
int addTwoNumbers(int a, int b) {
    return a + b;
}

void addArraysInt32(std::vector<int32_t>& array1, std::vector<int32_t>& array2, std::vector<int32_t>& result) {
    auto length = array1.size();
    for (int i = 0; i < length; ++i) {
        result[i] = array1[i] + array2[i];
    }
}

EMSCRIPTEN_BINDINGS(my_module) {
    register_vector<int32_t>("Int32Vector");
    function("sayHello", &say_hello);
    function("addTwoNumbers", &addTwoNumbers);
    function("addArraysInt32", &addArraysInt32);
}