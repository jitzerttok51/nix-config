final: prev: {
  qtstyleplugin-kvantum = prev.qtstyleplugin-kvantum.overrideAttrs (oldAttrs: {
    postInstall = ''
      echo "List dirs"
      echo "List dirs"
      ls
      ${oldAttrs.postInstall or ""}
    '';
    postPhases = "postInstall";
  });
}