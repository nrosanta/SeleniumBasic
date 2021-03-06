
' ---------------------------------------------------------------------------------------
' Compares the rendering of two web pages.
' ---------------------------------------------------------------------------------------

Class Script
    Dim driver

    Sub Class_Initialize
        Set driver = CreateObject("Selenium.FirefoxDriver")

        'Open Google search UK
        driver.Get "https://www.google.co.uk"

        'Set the window's size in pixels 
        driver.Window.SetSize 1024, 768

        'Capture the rendering with a 500ms delay
        Set imageA = driver.TakeScreenshot(500)

        'Save the image to a file without disposing it (False)
        imageA.SaveAs "image-a.png", False

        'Open Google search FR
        driver.Get "https://www.google.fr"

        'Capture the rendering with a 500ms delay
        Set imageB = driver.TakeScreenshot(500)

        'Save the image to a file without disposing it (False)
        imageB.SaveAs "image-b.png", False

        'Compare image A with image B in a new image
        Set imageDiff = imageA.CompareTo(imageB)
        'Save the new image to a file
        imageDiff.SaveAs "image-diff.png"

        'Show a dialogue box with the number of different pixels
        WScript.Echo imageDiff.DiffCount & " different pixels"    
    End Sub

    Sub Class_Terminate
        driver.Quit
    End Sub
End Class

Set s = New Script
