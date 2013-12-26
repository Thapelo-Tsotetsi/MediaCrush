self.addEventListener('message', (e) ->
    switch e.data.action
        when 'compute-hash'
            computeHash(e.data)
, false)

computeHash = (e) ->
    hash = btoa(rstr_md5(e.data)).substr(0, 12).replace('+', '-', 'g').replace('/', '_', 'g')
    self.postMessage({
        execute: "#{ e.callback }('#{ e.id }', '#{ hash }')"
    })

`
/* Slightly modified version of https://github.com/blueimp/JavaScript-MD5 */
function h(a,g){var c=(a&65535)+(g&65535);return(a>>16)+(g>>16)+(c>>16)<<16|c&65535}function k(a,g,c,l,q,r,b){return h(h(h(a,g&c|~g&l),h(q,b))<<r|h(h(a,g&c|~g&l),h(q,b))>>>32-r,g)}function m(a,g,c,l,q,r,b){return h(h(h(a,g&l|c&~l),h(q,b))<<r|h(h(a,g&l|c&~l),h(q,b))>>>32-r,g)}function n(a,g,c,l,q,r,b){return h(h(h(a,g^c^l),h(q,b))<<r|h(h(a,g^c^l),h(q,b))>>>32-r,g)}function p(a,g,c,l,q,r,b){return h(h(h(a,c^(g|~l)),h(q,b))<<r|h(h(a,c^(g|~l)),h(q,b))>>>32-r,g)}
self.rstr_md5=function(a){var g,c=[];c[(a.length>>2)-1]=void 0;for(g=0;g<c.length;g+=1)c[g]=0;for(g=0;g<8*a.length;g+=8)c[g>>5]|=(a.charCodeAt(g/8)&255)<<g%32;a=8*a.length;c[a>>5]|=128<<a%32;c[(a+64>>>9<<4)+14]=a;var l,q,r,b=1732584193,d=-271733879,e=-1732584194,f=271733878;for(a=0;a<c.length;a+=16)g=b,l=d,q=e,r=f,b=k(b,d,e,f,c[a],7,-680876936),f=k(f,b,d,e,c[a+1],12,-389564586),e=k(e,f,b,d,c[a+2],17,606105819),d=k(d,e,f,b,c[a+3],22,-1044525330),b=k(b,d,e,f,c[a+4],7,-176418897),f=k(f,b,d,e,c[a+5],
12,1200080426),e=k(e,f,b,d,c[a+6],17,-1473231341),d=k(d,e,f,b,c[a+7],22,-45705983),b=k(b,d,e,f,c[a+8],7,1770035416),f=k(f,b,d,e,c[a+9],12,-1958414417),e=k(e,f,b,d,c[a+10],17,-42063),d=k(d,e,f,b,c[a+11],22,-1990404162),b=k(b,d,e,f,c[a+12],7,1804603682),f=k(f,b,d,e,c[a+13],12,-40341101),e=k(e,f,b,d,c[a+14],17,-1502002290),d=k(d,e,f,b,c[a+15],22,1236535329),b=m(b,d,e,f,c[a+1],5,-165796510),f=m(f,b,d,e,c[a+6],9,-1069501632),e=m(e,f,b,d,c[a+11],14,643717713),d=m(d,e,f,b,c[a],20,-373897302),b=m(b,d,e,f,
c[a+5],5,-701558691),f=m(f,b,d,e,c[a+10],9,38016083),e=m(e,f,b,d,c[a+15],14,-660478335),d=m(d,e,f,b,c[a+4],20,-405537848),b=m(b,d,e,f,c[a+9],5,568446438),f=m(f,b,d,e,c[a+14],9,-1019803690),e=m(e,f,b,d,c[a+3],14,-187363961),d=m(d,e,f,b,c[a+8],20,1163531501),b=m(b,d,e,f,c[a+13],5,-1444681467),f=m(f,b,d,e,c[a+2],9,-51403784),e=m(e,f,b,d,c[a+7],14,1735328473),d=m(d,e,f,b,c[a+12],20,-1926607734),b=n(b,d,e,f,c[a+5],4,-378558),f=n(f,b,d,e,c[a+8],11,-2022574463),e=n(e,f,b,d,c[a+11],16,1839030562),d=n(d,e,
f,b,c[a+14],23,-35309556),b=n(b,d,e,f,c[a+1],4,-1530992060),f=n(f,b,d,e,c[a+4],11,1272893353),e=n(e,f,b,d,c[a+7],16,-155497632),d=n(d,e,f,b,c[a+10],23,-1094730640),b=n(b,d,e,f,c[a+13],4,681279174),f=n(f,b,d,e,c[a],11,-358537222),e=n(e,f,b,d,c[a+3],16,-722521979),d=n(d,e,f,b,c[a+6],23,76029189),b=n(b,d,e,f,c[a+9],4,-640364487),f=n(f,b,d,e,c[a+12],11,-421815835),e=n(e,f,b,d,c[a+15],16,530742520),d=n(d,e,f,b,c[a+2],23,-995338651),b=p(b,d,e,f,c[a],6,-198630844),f=p(f,b,d,e,c[a+7],10,1126891415),e=p(e,
f,b,d,c[a+14],15,-1416354905),d=p(d,e,f,b,c[a+5],21,-57434055),b=p(b,d,e,f,c[a+12],6,1700485571),f=p(f,b,d,e,c[a+3],10,-1894986606),e=p(e,f,b,d,c[a+10],15,-1051523),d=p(d,e,f,b,c[a+1],21,-2054922799),b=p(b,d,e,f,c[a+8],6,1873313359),f=p(f,b,d,e,c[a+15],10,-30611744),e=p(e,f,b,d,c[a+6],15,-1560198380),d=p(d,e,f,b,c[a+13],21,1309151649),b=p(b,d,e,f,c[a+4],6,-145523070),f=p(f,b,d,e,c[a+11],10,-1120210379),e=p(e,f,b,d,c[a+2],15,718787259),d=p(d,e,f,b,c[a+9],21,-343485551),b=h(b,g),d=h(d,l),e=h(e,q),f=
h(f,r);c=[b,d,e,f];g="";for(a=0;a<32*c.length;a+=8)g+=String.fromCharCode(c[a>>5]>>>a%32&255);return g};
`
