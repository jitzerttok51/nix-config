{ config, pkgs, mc-sur-plasma, ... }: {
  options = {};
  config = {
    home.file = {
      ".config/Kvantum/McSur-dark/".source = "${mc-sur-plasma}/Kvantum/McSur-dark/";
      ".config/Kvantum/McSur-light/".source = "${mc-sur-plasma}/Kvantum/McSur-light/";
      ".local/share/aurorae/themes/McSur-dark/".source = "${mc-sur-plasma}/share/aurorae/themes/McSur-dark/";
      ".local/share/aurorae/themes/McSur-light/".source = "${mc-sur-plasma}/share/aurorae/themes/McSur-light/";
      ".local/share/aurorae/themes/McSur-Sharp-dark/".source = "${mc-sur-plasma}/share/aurorae/themes/McSur-Sharp-dark/";
      ".local/share/color-schemes/McSurDark.colors".source = "${mc-sur-plasma}/share/color-schemes/McSurDark.colors";
      ".local/share/color-schemes/McSurLight.colors".source = "${mc-sur-plasma}/share/color-schemes/McSurLight.colors";
      ".local/share/plasma/desktoptheme/McSur-dark/".source = "${mc-sur-plasma}/share/plasma/desktoptheme/McSur-dark/";
      ".local/share/plasma/desktoptheme/McSur-light/".source = "${mc-sur-plasma}/share/plasma/desktoptheme/McSur-light/";
      ".local/share/plasma/look-and-feel/com.github.yeyushengfan258.McSur-dark/".source = "${mc-sur-plasma}/share/plasma/look-and-feel/com.github.yeyushengfan258.McSur-dark/";
      ".local/share/plasma/look-and-feel/com.github.yeyushengfan258.McSur-light/".source = "${mc-sur-plasma}/share/plasma/look-and-feel/com.github.yeyushengfan258.McSur-light/";
      ".local/share/plasma/look-and-feel/com.github.yeyushengfan258.McSur-light-alt/".source = "${mc-sur-plasma}/share/plasma/look-and-feel/com.github.yeyushengfan258.McSur-light-alt/";
      ".local/share/wallpapers/McSur-dark/".source = "${mc-sur-plasma}/share/wallpapers/McSur-dark/";
      ".local/share/wallpapers/McSur-light/".source = "${mc-sur-plasma}/share/wallpapers/McSur-light/";
    };
  };
}