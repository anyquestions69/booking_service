(window.webpackJsonp=window.webpackJsonp||[]).push([[0],{13:function(e,a,n){},14:function(e,a,n){"use strict";n.r(a);var t=n(0),c=n.n(t),l=n(5),r=n.n(l),s=n(7),i=n(3),m=(n(13),n(6)),o=[{name:"Avenger",price:10,occupied:[20,21,30,1,2,8]},{name:"Joker",price:12,occupied:[9,41,35,11,65,26]},{name:"Toy story",price:8,occupied:[37,25,44,13,2,3]},{name:"the lion king",price:9,occupied:[10,12,50,33,28,47]}],u=Array.from({length:988},function(e,a){return a});function p(){var e=Object(t.useState)(o[0]),a=Object(i.a)(e,2),n=a[0],l=a[1],r=Object(t.useState)([]),s=Object(i.a)(r,2),m=s[0],u=s[1];return c.a.createElement("div",{className:"App"},c.a.createElement(d,{movie:n,onChange:function(e){u([]),l(e)}}),c.a.createElement(E,null),c.a.createElement(v,{movie:n,selectedSeats:m,onSelectedSeatsChange:function(e){return u(e)}}),c.a.createElement("p",{className:"info"},"You have selected ",c.a.createElement("span",{className:"count"},m.length)," ","seats for the price of"," ",c.a.createElement("span",{className:"total"},m.length*n.price,"$")))}function d(e){var a=e.movie,n=e.onChange;return c.a.createElement("div",{className:"Movies"},c.a.createElement("label",{htmlFor:"movie"},"Pick a movie"),c.a.createElement("select",{id:"movie",value:a.name,onChange:function(e){n(o.find(function(a){return a.name===e.target.value}))}},o.map(function(e){return c.a.createElement("option",{key:e.name,value:e.name},e.name," ($",e.price,")")})))}function E(){return c.a.createElement("ul",{className:"ShowCase"},c.a.createElement("li",null,c.a.createElement("span",{className:"seat"})," ",c.a.createElement("small",null,"N/A")),c.a.createElement("li",null,c.a.createElement("span",{className:"seat selected"})," ",c.a.createElement("small",null,"Selected")),c.a.createElement("li",null,c.a.createElement("span",{className:"seat occupied"})," ",c.a.createElement("small",null,"Occupied")))}function v(e){var a=e.movie,n=e.selectedSeats,t=e.onSelectedSeatsChange;function l(e){var a=n.includes(e);t(a?n.filter(function(a){return a!==e}):[].concat(Object(s.a)(n),[e]))}return c.a.createElement("div",{className:"Cinema"},c.a.createElement("div",{className:"screen"}),c.a.createElement("div",{className:"seats"},u.map(function(e){var t=n.includes(e),r=a.occupied.includes(e);return c.a.createElement("span",{tabIndex:"0",key:e,className:Object(m.a)("seat",t&&"selected",r&&"occupied"),onClick:r?null:function(){return l(e)},onKeyPress:r?null:function(a){"Enter"===a.key&&l(e)}})})))}var f=document.getElementById("root");r.a.render(c.a.createElement(p,null),f)},8:function(e,a,n){e.exports=n(14)}},[[8,1,2]]]);
//# sourceMappingURL=main.06a4c505.chunk.js.map