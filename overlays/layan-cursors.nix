final: prev: {
  layan-cursors = prev.layan-cursors.overrideAttrs (oldAttrs: {
    postInstall = ''
      ${oldAttrs.postInstall or ""}
      echo "Adding Layan white cursors..."
      cp -R dist-white $out/share/icons/layan-cursors-white
    '';
    postPhases = "postInstall";
  });
}