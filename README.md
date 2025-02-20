#   Automatic language translator engine for Delphi (RTTI-based)  

**DESCRIPTION**  

 This class will translate all components (on a form) that have a text-like property (for example: TLabel.Caption, TLabel.Hint, TMenuItem.Caption).  
 It does this automatically (no line of code necessary) for all forms created with AppData.CreateForm().  
 The text is stored in an INI file which can be sent to DeepL or GoogleTranslate for translation.   
  
Translate your application with only two lines of code:   
![Translator Code](https://github.com/GabrielOnDelphi/DelphiLightSaber-AutoTranslator/assets/31410401/5e2722e2-93cf-4628-8995-e76f5214b1e4)

--------------------------------------------------------------------------------------------------------------  
 
Example of GUI in three languages:

![cn](https://github.com/user-attachments/assets/673f1994-f2b2-4e57-8692-d09170f8d5cf)
![de](https://github.com/user-attachments/assets/1659d414-8fec-43bf-94f8-1fc3bbf6b5b0)
![en](https://github.com/user-attachments/assets/41485195-5b31-459a-afa6-5f1a44e8fdf0)


--------------------------------------------------------------------------------------------------------------

**Downloading the code**  

This code has been merged with the [LightSaber Core](https://github.com/GabrielOnDelphi/Delphi-LightSaber) library.   
The new code should be downloaded now from there.  
This repository is now only a placeholder.   
  
Official page: https://gabrielmoraru.com/delphi-rtti-based-automatic-language-translator-engine/  

**Features**

     Changes the GUI language live, without the need to restart the app.

     Embedded tools:
        It offers a "transaltion editor" form. See: FormTranslEditor.pas
        It offers a "transaltion selctor" form. See: FormTranslSelector.pas
        The user can create his own translations easily (with the above mentione utility).
        The text translated can be seen live, as we translate it (press Apply).

     Instant translations:
        TO BE IMPLEMENTED!
        Press the "Translate to xyz language" button. The GUI text is sent to "Google Translate" (API)
        and seconds later the GUI switches to that new language.

     RTTI-based
        Supports everything:
          Support for multiple properties (Caption, TextHint, or Hint).
          Support for ANY classic Delphi control (TButton, TLable, TCheckbox, etc) that implements those properties.
          Support for ANY classic Delphi component (TMenu, TAction, etc)
          Support for ANY custom-made/3rd party Delphi component

     Programmer perspective
        Easy to integrate
        Zero lines of code necessary!
        Low dependency
        Full Unicode support
        Clean code, documented, tested (mostly) & Demo app

     User perspective
        Easy to use
        All text is automatically saved to an INI file.
        The user does not have to collect the text manually from the screen.
        No room for errors (missed/hidden text).
        The LightSaber\Demo\Tester AutoTranslator\Lang\How to translate.rtf file explain to the end user how to create his own translations.


   **Limitations**  
   
       1. Cannot translate forms that are not live (naturally)  
          Proposed solution: Add a flag like TTranslator.LiveTranslation.
          When a new form is created it will check the flag.
          If the flag is true, the form will save itself to the English INI file.
  
       2. Strings into the source code will not be translated automatically (naturally)  
          Proposed solution: Add a function that can read strings from the INI file. Add support for something similar to the Format(%s %f Fd) Delphi function.  
          Proposed solution: If the strings are embedded as resources, we can translate them live.  
  
--------------------------------------------------------------------------------------------------------------

   **HOW TO USE IT**

    * Automatically

         AppData will automatically create the Translator object.
         Create a new form with AppData.CreateForm(). This will take care of everything. Seriously!

         Check the cbAppData.pas for more info.

    * Manually

         procedure TForm1.FormCreate;
         begin
          Translator:= TTranslator.Create;
          Translator.LoadTranslation(Form1);
          Translator.Free;
         end;

    * To save all live forms to the INI file to be translated:

        a. Call Translator.SaveTranslation;                    //Note: Only currently existing/live forms will be saved to disk.
        b. Manually translate the text (or use www.DeepL.com). There is a helper tool in FormTranslEditor.pas.
        c. Place the newly translated file in the 'Lang' folder. The program will discover the new file when the  New -> TfrmTranslSelector.ShowSelector procedure is called (no need to restart).


    * Let the user switch the language:

        a. Call TfrmTranslSelector.ShowSelector
        b. Languages are switched 'Live'. No need to restart the program.


--------------------------------------------------------------------------------------------------------------  
  
    **INFO**  
       The path where the translation files are stored, is returned by GetLangFolder().
       If no translation is found in the INI file for a GUI control, its text will be left untranslated.  
       Mark controls that should not be translated (for ex, labels that will have their caption changed dynamically) with Tag=128  
  
    **WARNING**  
       Make sure you make your GUI controls (labels, buttons, etc) large enough. Some languages require more space (more characters) than others.  
  
    **TESTER**
       LightSaber\Demo\Tester AutoTranslator\AutoTranslatorDemo.dpr



