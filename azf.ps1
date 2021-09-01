$connectTestResult = Test-NetConnection -ComputerName frdevncusiissa.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"frdevncusiissa.file.core.windows.net`" /user:`"localhost\frdevncusiissa`" /pass:`"iKYeCTZSIrmOAB01LYej8gnGm7tTb26oPv18Nm75OxKImmQw01kxpfkjnbgzgyEFmFFHgnP5FNKldUULdFkAcw==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\frdevncusiissa.file.core.windows.net\fr-dev-ncus-iis-af" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}