/*
  ================================================
  IFRAME RESPONSIVENESS
  ================================================
*/
(function () {
  'use strict';

  var iframes = document.querySelectorAll('iframe');

  [].forEach.call(iframes, function (iframe) {
    var outside = iframe.parentNode;
    var resizeLength = iframe.parentNode.querySelector('.resizeable-pattern-length');

    if (!resizeLength) return;

    interact(resizeLength).resizable({
      edges: {
        left: '.resize-handle-left',
        right: '.resize-handle-right',
        bottom: false,
        top: false,
      },
      onmove: function (e) {
        var width = e.rect.width;
        var availableSpace = outside.parentNode.clientWidth - parseInt(getComputedStyle(outside.parentNode).paddingLeft.replace(/px/), 10) - parseInt(getComputedStyle(outside.parentNode).paddingRight.replace(/px/), 10);

        if (width < 120) width = 120;
        if ((width * 2) > availableSpace) width = availableSpace / 2;

        iframe.style.pointerEvents = 'none';
        outside.style.width = (width * 2) + 'px';
        resizeLength.style.width = (width * 1) + 'px';
        iframe.iFrameResizer.resize();
      },
      onend: function () {
        iframe.style.pointerEvents = 'auto';
        iframe.iFrameResizer.resize();
      },
    });
  });
}());

/*
  ================================================
  NAVIGATION TABS
  ================================================
*/
(function () {
  'use strict';

  var tablist = document.querySelectorAll('[role="tablist"] a');
  var possibleInitialTab;

  var loadAllVisibleIframes = function () {
    var visibleIframes = document.querySelectorAll('[role="tabpanel"]:not([hidden]) iframe');

    if (!visibleIframes) return;

    [].forEach.call(visibleIframes, function (iframe) {
      if (!iframe.src) {
        iframe.addEventListener('load', function (e) {
          iFrameResize({
            heightCalculationMethod: 'max',
            minHeight: (e.target.dataset.minHeight) ? parseInt(e.target.dataset.minHeight, 10) : 0,
            resizedCallback: function (opts) {
              opts.iframe.previousElementSibling.setAttribute('hidden', true);
              opts.iframe.parentNode.style.minHeight = 0;
              opts.iframe.style.opacity = 1;
            },
          }, e.target);
        });

        iframe.src = iframe.dataset.src;
      }
    });
  };

  var switchTabs = function (link) {
    var openLinks = document.querySelectorAll('[role="tab"][aria-selected="true"]');
    var openTabs = document.querySelectorAll('[role="tabpanel"]:not([hidden])');
    var newTab = document.getElementById(link.getAttribute('aria-controls'));

    if (openTabs) {
      [].forEach.call(openTabs, function (openTab) {
        openTab.setAttribute('hidden', true);
        openTab.setAttribute('aria-hidden', true);
      });
    }

    if (openLinks) {
      [].forEach.call(openLinks, function (openLink) {
        openLink.setAttribute('aria-selected', false);
      });
    }

    newTab.removeAttribute('hidden');
    newTab.setAttribute('aria-hidden', false);
    link.setAttribute('aria-selected', true);
    window.location.hash = link.getAttribute('href');

    requestAnimationFrame(function () { window.scrollTo(0, 0); });

    loadAllVisibleIframes();
  };

  var switchToFirstTab = function () {
    var firstATag = document.querySelector('[role="tablist"] > li:first-child [role="tab"]');

    if (firstATag) switchTabs(firstATag);
  };

  if (!tablist) return;

  [].forEach.call(tablist, function (link) {
    link.addEventListener('click', function (e) {
      switchTabs(link);
    });
  });

  if (window.location.hash) {
    possibleInitialTab = document.querySelector('[role="tab"][href="' + window.location.hash.split(/\-\-/)[0] + '"]');

    if (possibleInitialTab) {
      switchTabs(possibleInitialTab);
    } else {
      switchToFirstTab();
    }
  } else {
    switchToFirstTab();
  }
}());

/*
  ================================================
  CODE TOGGLE BUTTON
  ================================================
*/
(function () {
  'use strict';

  var codeBtns = document.querySelectorAll('.pattern-code-btn');

  var toggleCodeSample = function (e) {
    var theId, theCodeBlock;

    e.preventDefault();

    theId = this.getAttribute('aria-controls');
    theCodeBlock = document.getElementById(theId);

    if (this.getAttribute('aria-pressed') == 'true') {
      this.setAttribute('aria-pressed', false);
      theCodeBlock.setAttribute('hidden', true);
      theCodeBlock.setAttribute('aria-hidden', true);
    } else {
      this.setAttribute('aria-pressed', true);
      theCodeBlock.removeAttribute('hidden');
      theCodeBlock.setAttribute('aria-hidden', false);
      theCodeBlock.focus();
    }
  };

  if (!codeBtns) return;

  [].forEach.call(codeBtns, function (btn) {
    btn.addEventListener('click', toggleCodeSample);
  });
}());

/*
  ================================================
  TOGGLE NAVIGATION
  ================================================
*/
(function () {
  'use strict';

  var navBtn = document.querySelector('.nav-btn');
  var nav = document.getElementById('patternbot-nav');

  var showNav = function () {
    nav.setAttribute('aria-hidden', false);
    navBtn.setAttribute('aria-expanded', true);
    navBtn.setAttribute('aria-label', 'Close nav');
  };

  var hideNav = function () {
    nav.setAttribute('aria-hidden', true);
    navBtn.setAttribute('aria-expanded', false);
    navBtn.setAttribute('aria-label', 'Open nav');
  };

  var toggleNav = function () {
    if (nav.getAttribute('aria-hidden') === 'true') {
      showNav();
    } else {
      hideNav();
    }
  };

  var toggleBasedOnScreen = function () {
    if (window.matchMedia('(min-width: 38em)').matches) {
      showNav();
    } else {
      hideNav();
    }
  };

  navBtn.addEventListener('click', toggleNav);

  nav.addEventListener('click', function (e) {
    if (e.target.matches('a, button')) toggleNav();
  });

  try {
    window.matchMedia('(min-width: 38em)').addEventListener('change', toggleBasedOnScreen);
  } catch (e) {
    var windowResizeTimer;

    window.addEventListener('resize', function () {
      clearTimeout(windowResizeTimer);
      setTimeout(toggleBasedOnScreen, 100);
    });
  }

  toggleBasedOnScreen();
}());
