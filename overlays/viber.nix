final: prev: {
  viber = prev.viber.overrideAttrs (oldAttrs: {
    postInstall = ''
      ${oldAttrs.postInstall or ""}
      echo "Patching viber.desktop file..."
      substituteInPlace $out/share/applications/viber.desktop \
        --replace Path=/opt/viber/ Path=$out/opt/viber/
    '';
    postPhases = "postInstall";
  });
}