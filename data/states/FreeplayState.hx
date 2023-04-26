function postUpdate() {
    for(text in grpSongs.members)
        text.x = 640 - text.width / 1.20;
    for(icon in iconArray)
      icon.setPosition(icon.sprTracker.x + icon.sprTracker.width + 10, icon.sprTracker.y - 30);
}