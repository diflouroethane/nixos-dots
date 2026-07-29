let
  ethan = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICQm80zD5rfLR1hyGAog+0fxlt0H6jOvgCDKiB3sOeT9 ethanfrancis577@gmail.com";
  users = [ ethan ];
in
{
  "wakatime.age".publicKeys = [ethan];
}
