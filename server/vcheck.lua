print(' xHUD - Version Check\nThis resource is open source and available on GitHub:\nhttps://github.com/Michatec/xhud')
print('Checking for updates...')
if lib.versionCheck('michatec/xhud') then
    print('You are running the latest version of xhud.')
else
    print('Update available for xhud, please update to the latest version.')
    print('Download it from https://github.com/Michatec/xhud')
end
