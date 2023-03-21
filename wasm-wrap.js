import wasm from "./wasm-module.js";
const promise = wasm().then(function(module) {
    function addArraysInt32(a, b) {
        const va = new module.Int32Vector();
        const vb = new module.Int32Vector();
        const vr = new module.Int32Vector();
        for (let i = 0; i < a.length; i++) {
            va.push_back(a[i]);
            vb.push_back(b[i]);
            vr.push_back(0);
        }
        module.addArraysInt32(va, vb, vr);
        const r = [];
        for (let i = 0; i < a.length; i++)
            r.push(vr.get(i));
        return r;
    }
    return {
        sayHello: module.sayHello,
        add: module.addTwoNumbers,
        addArrays: addArraysInt32,
    };
});

// Uncomment for global accessability as Promise
//window.wasmWrapProvider = promise;

// Export
export default promise;