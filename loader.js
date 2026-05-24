(function () {
  const script = document.currentScript;
  const sectionId = script && script.dataset ? script.dataset.section : null;
  if (!sectionId) return;

  function render() {
    const map = window.GM_SECTIONS || {};
    const html = map[sectionId];
    if (!html) return;
    const el = document.getElementById(sectionId);
    if (!el) return;
    el.innerHTML = html;
  }

  if (window.GM_SECTIONS) {
    render();
    return;
  }

  const s = document.createElement("script");
  s.src = "https://cdn.jsdelivr.net/gh/slapassound/groovemu-web@main/sections.js";
  s.onload = render;
  document.head.appendChild(s);
})();
