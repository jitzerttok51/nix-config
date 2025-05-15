self: super: {
  viber = super.viber.overrideAttrs (oldAttrs: {
    postInstall = ''
      ${oldAttrs.postInstall or ""}
      echo "Patching viber.desktop file..."
      substituteInPlace $out/share/applications/viber.desktop \
        --replace /opt/viber/ $out/opt/viber/ \
    '';
  });
}