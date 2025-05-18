{ config, pkgs, mc-mojave-plasma, ... }: {
  options = {};
  config = {
    home.file = {
      ".config/Kvantum/McMojave/".source = "${mc-mojave-plasma}/Kvantum/McMojave/";
      ".config/Kvantum/McMojave-light/".source = "${mc-mojave-plasma}/Kvantum/McMojave-light/";
      
      ".local/share/aurorae/themes/McMojave/".source = "${mc-mojave-plasma}/share/aurorae/themes/McMojave/";
      ".local/share/aurorae/themes/McMojave-1.5x/".source = "${mc-mojave-plasma}/share/aurorae/themes/McMojave-1.5x/";
      ".local/share/aurorae/themes/McMojave-light/".source = "${mc-mojave-plasma}/share/aurorae/themes/McMojave-light/";
      ".local/share/aurorae/themes/McMojave-light-1.5x/".source = "${mc-mojave-plasma}/share/aurorae/themes/McMojave-light-1.5x/";

      ".local/share/color-schemes/McMojave.colors".source = "${mc-mojave-plasma}/share/color-schemes/McMojave.colors";
      ".local/share/color-schemes/McMojaveLight.colors".source = "${mc-mojave-plasma}/share/color-schemes/McMojaveLight.colors";
      
      ".local/share/plasma/desktoptheme/McMojave/".source = "${mc-mojave-plasma}/share/plasma/desktoptheme/McMojave/";
      ".local/share/plasma/desktoptheme/McMojave-light/".source = "${mc-mojave-plasma}/share/plasma/desktoptheme/McMojave-light/";

      ".local/share/plasma/layout-templates/org.github.desktop.McMojavePanel/".source = "${mc-mojave-plasma}/share/plasma/layout-templates/org.github.desktop.McMojavePanel/";

      ".local/share/plasma/look-and-feel/com.github.vinceliuice.McMojave/".source = "${mc-mojave-plasma}/share/plasma/look-and-feel/com.github.vinceliuice.McMojave/";
      ".local/share/plasma/look-and-feel/com.github.vinceliuice.McMojave-light/".source = "${mc-mojave-plasma}/share/plasma/look-and-feel/com.github.vinceliuice.McMojave-light/";

      ".local/share/wallpapers/McMojave/".source = "${mc-mojave-plasma}/share/wallpapers/McMojave/";
      ".local/share/wallpapers/McMojave-dark/".source = "${mc-mojave-plasma}/share/wallpapers/McMojave-dark/";
      ".local/share/wallpapers/McMojave-light/".source = "${mc-mojave-plasma}/share/wallpapers/McMojave-light/";
    };
  };
}