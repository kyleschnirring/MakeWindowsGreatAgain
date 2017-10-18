<#
 .Synopsis
  Writes registry keys to stop Windows from placing ads and automatically installing apps

 .Description
  Writes registry keys to stop Windows from placing ads and automatically installing apps. Create a scheduled
  task so MakeWindowsGreatAgain.psm1 runs on startup. So when Windows is updated these items wont be reset. 
#>

function Invoke-MakeWindowsGreatAgain()
{
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name FeatureManagementEnabled -Type DWord -Value 00000000
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name OemPreInstalledAppsEnabled -Type DWord -Value 00000000
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name PreInstalledAppsEnabled -Type DWord -Value 00000000
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name RotatingLockScreenEnabled -Type DWord -Value 00000000
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name RotatingLockScreenOverlayEnabled -Type DWord -Value 00000000
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SilentInstalledAppsEnabled -Type DWord -Value 00000000
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SoftLandingEnabled -Type DWord -Value 00000000
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContentEnabled -Type DWord -Value 00000001
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SystemPaneSuggestionsEnabled -Type DWord -Value 00000000
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name RotatingLockScreenOverlayVisible -Type DWord -Value 00000000
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name ContentDeliveryAllowed -Type DWord -Value 00000001

    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowSyncProviderNotifications -Type DWord -Value 00000000
    Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowSyncProviderNotifications -Type DWord -Value 00000000
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\"Lock Screen"\Creative -Name CreativeJson -Type String -Value ""
    #Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Type DWord -Value 00000000
    #Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy -Name TailoredExperiencesWithDiagnosticDataEnabled -Type DWord -Value 00000000
}

Export-ModuleMember -function 'Invoke-MakeWindowsGreatAgain'
