!function(){"use strict";$(function(){$(document).on("click",".b-example__link:not(.b-example__link_active_true)",function(e){var t=$(e.target),n=t.closest(".b-example"),a=t.text();t.addClass("b-example__link_active_true").siblings().removeClass("b-example__link_active_true"),n.find(".b-example__code > pre:not(.example-"+a+")").hide(),n.find(".example-"+a).show()})}),$(function(){var e=$(document),t=$("nav.b-contents"),n=$("header.b-header").innerHeight(),a=$(".b-articles__nav-cont");e.on("scroll",function(){e.scrollTop()>=n?(t.addClass("b-contents_full_true"),a.addClass("b-articles__nav-cont_full_true")):(t.removeClass("b-contents_full_true"),a.removeClass("b-articles__nav-cont_full_true"))})}),$(function(){function e(){function e(e){e.length||(e=$(".b-article:eq(0)"),l=e.attr("id")),$(".b-article").removeClass("b-article_active_true"),e.addClass("b-article_active_true"),t=e;var c=e.attr("id"),s=i.find(".b-contents__link[href='#"+c+"']");i.find(".b-contents__link").removeClass("b-contents__link_active_true").closest("li").find(".b-contents__sub").remove(),s.addClass("b-contents__link_active_true");var o=$('<ul class="b-contents__sub">'),_=2;e.find("h2, h3").each(function(e,t){var n=Number(/\d+/.exec(t.tagName.toLowerCase())[0]);if(n>_){var a=$('<li class="b-contents__part b-contents__part_link_false"><ul></li>');o.append(a),o=a.find("ul")}else _>n&&(o=o.parent().closest("ul"));_!==n&&(_=n),o.append($('\n						<li class="b-contents__part b-contents__part_link_true">\n							<a href="#'+t.id+'" class="b-contents__link b-contents__link_active_'+(l.slice(1)===t.id)+'">'+t.textContent+"</a>\n						</li>\n					"))}),s.closest("li").append(o.is(".b-contents__sub")?o:o.closest(".b-contents__sub")),c===$(".b-article:eq(0)").attr("id")?n.addClass("b-articles__nav-cont_hidden_true"):n.removeClass("b-articles__nav-cont_hidden_true"),c===$(".b-article:eq(-1)").attr("id")?a.addClass("b-articles__nav-cont_hidden_true"):a.removeClass("b-articles__nav-cont_hidden_true")}var l=decodeURIComponent(location.hash),c=l&&$(l),s=$(window),o=250,_=Boolean(c);!l||c.hasClass("b-article")?(e(c),s.scrollTo(0,o)):(e(c.closest(".b-article")),c.length&&s.scrollTo(c.offset().top,o)),l!==location.hash&&(_||!location.hash?location.replace(location.pathname+("#"===l[0]?l:"#"+l)):location.hash=l)}$(".b-article").find("h2, h3, h4, h5, h6").each(function(e,t){t.id=$(t).closest(".b-article").attr("id")+"--"+t.textContent.trim().replace(/[\s.,$]/g,"_")});var t=void 0,n=$(".b-articles__prev"),a=$(".b-articles__next");n.on("click",function(){t&&(location.hash=t.prev(".b-article").attr("id"))}),a.on("click",function(){t&&(location.hash=t.next(".b-article").attr("id"))}),$(document).on("click","h2[id], h3[id], h4[id], h5[id], h6[id]",function(e){location.hash=e.target.id}).on("keypress",function(e){e.altKey&&{37:!0,39:!0}[e.keyCode]&&(e.preventDefault(),37!==e.keyCode||n.hasClass("b-articles__nav-cont_hidden_true")?39!==e.keyCode||a.hasClass("b-articles__nav-cont_hidden_true")||a.trigger("click"):n.trigger("click"))});var i=$(".b-contents");$(window).on("hashchange",(e(),e))})}();