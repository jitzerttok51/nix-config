{
  config,
  pkgs,
  layan-plasma,
  ...
}: {
  options = {};
  config = {
    home.file = {
      ".local/share/aurorae/themes/Layan/".source = "${layan-plasma}/share/aurorae/themes/Layan/";
      ".local/share/aurorae/themes/Layan-light/".source = "${layan-plasma}/share/aurorae/themes/Layan-light/";
      ".local/share/aurorae/themes/Layan-solid/".source = "${layan-plasma}/share/aurorae/themes/Layan-solid/";
      ".local/share/color-schemes/Layan.colors".source = "${layan-plasma}/share/color-schemes/Layan.colors";
      ".local/share/color-schemes/LayanLight.colors".source = "${layan-plasma}/share/color-schemes/LayanLight.colors";
      ".local/share/plasma/desktoptheme/Layan/".source = "${layan-plasma}/share/plasma/desktoptheme/Layan/";
      ".local/share/plasma/desktoptheme/Layan-light/".source = "${layan-plasma}/share/plasma/desktoptheme/Layan-light/";
      ".local/share/plasma/look-and-feel/com.github.vinceliuice.Layan/".source = "${layan-plasma}/share/plasma/look-and-feel/com.github.vinceliuice.Layan/";
      ".local/share/plasma/look-and-feel/com.github.vinceliuice.Layan-light/".source = "${layan-plasma}/share/plasma/look-and-feel/com.github.vinceliuice.Layan-light/";
      ".local/share/wallpapers/Layan/".source = "${layan-plasma}/share/wallpapers/Layan/";
      ".local/share/wallpapers/Layan-light/".source = "${layan-plasma}/share/wallpapers/Layan-light/";
    };
  };
}
