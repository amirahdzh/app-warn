# Load Windows Forms dan Drawing
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()

# Path gambar background (opsional)
$imagePath = "C:\Users\amira\warn\assets\background.jpg"

# Ambil aplikasi target dari argumen
$targetApp = $args[0]
$targetArgs = $args[1]

# Debugging Output
Write-Host "Target App: $targetApp"
Write-Host "Target Args: $targetArgs"

# Pastikan argumen tidak kosong
if (-not $targetApp) {
    [System.Windows.Forms.MessageBox]::Show("Gagal mendeteksi aplikasi.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    exit
}

# Fungsi untuk menampilkan form peringatan
function Show-WarningForm {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Peringatan!"
    $form.Size = New-Object System.Drawing.Size(400, 220)
    $form.StartPosition = "CenterScreen"
    $form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false

    if (Test-Path $imagePath) {
        $form.BackgroundImage = [System.Drawing.Image]::FromFile($imagePath)
        $form.BackgroundImageLayout = [System.Windows.Forms.ImageLayout]::Stretch
    }

    $label = New-Object System.Windows.Forms.Label
    $label.Text = "APLIKASI YANG KAMU BUKA BERBAHAYA!" + [System.Environment]::NewLine + "Yakin mau buka?"
    $label.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
    $label.ForeColor = [System.Drawing.Color]::FromArgb(90, 30, 100)
    $label.BackColor = [System.Drawing.Color]::Transparent
    $label.Size = New-Object System.Drawing.Size(360, 60)
    $label.Location = New-Object System.Drawing.Point(20, 20)
    $label.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter

    $yesButton = New-Object System.Windows.Forms.Button
    $yesButton.Text = "Iya! :>"
    $yesButton.Font = New-Object System.Drawing.Font("Segoe UI", 12)
    $yesButton.Size = New-Object System.Drawing.Size(140, 45)
    $yesButton.Location = New-Object System.Drawing.Point(40, 120)
    $yesButton.BackColor = [System.Drawing.Color]::LightPink
    $yesButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
    $yesButton.DialogResult = [System.Windows.Forms.DialogResult]::OK

    $noButton = New-Object System.Windows.Forms.Button
    $noButton.Text = "Ga, deh :<"
    $noButton.Font = New-Object System.Drawing.Font("Segoe UI", 12)
    $noButton.Size = New-Object System.Drawing.Size(140, 45)
    $noButton.Location = New-Object System.Drawing.Point(210, 120)
    $noButton.BackColor = [System.Drawing.Color]::MistyRose
    $noButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
    $noButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel

    $form.Controls.Add($label)
    $form.Controls.Add($yesButton)
    $form.Controls.Add($noButton)
    $form.AcceptButton = $noButton
    $form.ActiveControl = $noButton  # atau tombol lain yang ingin jadi default

    return $form.ShowDialog()
}

# Fungsi untuk menampilkan form konfirmasi kedua
function Show-ConfirmationForm {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Konfirmasi"
    $form.Size = New-Object System.Drawing.Size(400, 200)
    $form.StartPosition = "CenterScreen"
    $form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false

    if (Test-Path $imagePath) {
        $form.BackgroundImage = [System.Drawing.Image]::FromFile($imagePath)
        $form.BackgroundImageLayout = [System.Windows.Forms.ImageLayout]::Stretch
    }

    $label = New-Object System.Windows.Forms.Label
    $label.Text = "Kerjaan kamu udah selesai, miw?"
    $label.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
    $label.ForeColor = [System.Drawing.Color]::FromArgb(90, 30, 100)
    $label.BackColor = [System.Drawing.Color]::Transparent
    $label.Size = New-Object System.Drawing.Size(360, 60)
    $label.Location = New-Object System.Drawing.Point(20, 20)
    $label.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter

    $doneButton = New-Object System.Windows.Forms.Button
    $doneButton.Text = "Sudah ><"
    $doneButton.Font = New-Object System.Drawing.Font("Segoe UI", 12)
    $doneButton.Size = New-Object System.Drawing.Size(140, 45)
    $doneButton.Location = New-Object System.Drawing.Point(40, 100)
    $doneButton.BackColor = [System.Drawing.Color]::LightPink
    $doneButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
    $doneButton.DialogResult = [System.Windows.Forms.DialogResult]::OK

    $notYetButton = New-Object System.Windows.Forms.Button
    $notYetButton.Text = "Belum :("
    $notYetButton.Font = New-Object System.Drawing.Font("Segoe UI", 12)
    $notYetButton.Size = New-Object System.Drawing.Size(140, 45)
    $notYetButton.Location = New-Object System.Drawing.Point(210, 100)
    $notYetButton.BackColor = [System.Drawing.Color]::MistyRose
    $notYetButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
    $notYetButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel

    $form.Controls.Add($label)
    $form.Controls.Add($doneButton)
    $form.Controls.Add($notYetButton)
    $form.AcceptButton = $notYetButton
    $form.ActiveControl = $notYetButton  # atau tombol lain yang ingin jadi default

    return $form.ShowDialog()
}

# Fungsi untuk menampilkan form pesan (Bye & Info)
function Show-MessageForm {
    param (
        [string]$message,
        [string]$title
    )

    $form = New-Object System.Windows.Forms.Form
    $form.Text = $title
    $form.Size = New-Object System.Drawing.Size(400, 180)
    $form.StartPosition = "CenterScreen"
    $form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false

    if (Test-Path $imagePath) {
        $form.BackgroundImage = [System.Drawing.Image]::FromFile($imagePath)
        $form.BackgroundImageLayout = [System.Windows.Forms.ImageLayout]::Stretch
    }

    $label = New-Object System.Windows.Forms.Label
    $label.Text = $message
    $label.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
    $label.ForeColor = [System.Drawing.Color]::FromArgb(90, 30, 100)
    $label.BackColor = [System.Drawing.Color]::Transparent
    $label.Size = New-Object System.Drawing.Size(360, 60)
    $label.Location = New-Object System.Drawing.Point(20, 20)
    $label.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter

    $okButton = New-Object System.Windows.Forms.Button
    $okButton.Text = "OK"
    $okButton.Font = New-Object System.Drawing.Font("Segoe UI", 12)
    $okButton.Size = New-Object System.Drawing.Size(140, 45)
    $okButton.Location = New-Object System.Drawing.Point(130, 80)
    $okButton.BackColor = [System.Drawing.Color]::LightPink
    $okButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
    $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK

    $form.Controls.Add($label)
    $form.Controls.Add($okButton)
    $form.AcceptButton = $okButton

    $form.ShowDialog()
}

# **Tampilkan form peringatan pertama**
$result = Show-WarningForm

if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    Write-Host "User memilih untuk melanjutkan"

    # **Tampilkan form konfirmasi kedua**
    $result2 = Show-ConfirmationForm

    if ($result2 -eq [System.Windows.Forms.DialogResult]::OK) {
        Write-Host "User sudah selesai kerja, menjalankan aplikasi"
        # **Tampilkan form "Oke, aplikasi dijalankan!"**
        Show-MessageForm -message "Oke, aplikasi dijalankan! ^^" -title "Info"

        if ($targetArgs) {
            Start-Process $targetApp -ArgumentList $targetArgs
        } else {
            Start-Process $targetApp
        }
    } else {
        Write-Host "User belum selesai kerja, aplikasi tidak dijalankan"
        # **Tampilkan form "Bye."**
        Show-MessageForm -message "Bye." -title "Pesan"
    }
} else {
    Write-Host "User membatalkan"
    # **Tampilkan form "Bye."**
        Show-MessageForm -message "Bye." -title "Pesan"
}
