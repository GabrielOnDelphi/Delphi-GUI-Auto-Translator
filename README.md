# DelphiLightSaber-AutoTranslator
  
RTTI-based automatic language translator engine.
  

  

  
{=============================================================================================================
  
   Gabriel Moraru / Heracle BioSoft SRL
  
   2022-09
  
   See Copyright.txt
  

  
   RTTI-based automatic language translator engine.
  

  
--------------------------------------------------------------------------------------------------------------
  
   DESCRIPTION
  
     This class will translate all GUI strings (for example TLabel.Caption, TLabel.Hint, TMenuItem.Caption)
  
     for all live forms in your application.
  
     The text is stored in a INI file which can be sent to DeepL or GoogleTranslate for translation.
  
--------------------------------------------------------------------------------------------------------------
  

  
   Advantages
  
     Changing language is life without need to restart app
  
     The text translated can be seen live, as we translate it
  
     User can create his own translations easily (with the included utility)
  
     Full unicode support
  
     All text is automatically saved to file.
  
        The user does not have to collect the text manually from the screen.
  
        No room for errors (missed/hidden text).
  
     Instant/automatic translations via Google Translate (not fully implemented yet)
  
        Press the "Translate to xyz language" button, then 3 seconds later the GUI switches to that language.
  
     RTTI based - Supports everything
  
        Support for multiple properties (Caption, TextHint or Hint).
  
        Support for ANY classic Delphi control (TButton, TLable, TCheckbox, etc) that implement those properties.
  
        Support for ANY classic Delphi component (TMenu, TAction, etc)
  
        Support for ANY custom-made/3rd party Delphi component
  
     Easy to integrate.
  
        Only 4 lines of code required.
  
        Low dependency
  
     Clean code, documented, tested (mostly) & Demo app
  

  
   Limitations
  
       1. Cannot translate forms that are not live (naturally)
  
          Proposed solution: Add a flag like TTranslator.LiveTranslation. When a new form is create it will check the flag. If the flag is true, the form will save itself to the English INI file.
  

  
       2. Strings into the source code will not be translated automatically (naturally)
  
          Proposed solution: Add a function that can read strings from the INI file. Add support for something similar to the Format(%s %f Fd) delphi function.
  
          Proposed solution: If the strings are embeded as resources, we can translated them life.
  

  
--------------------------------------------------------------------------------------------------------------
  
   HOW TO USE IT
  

  
    1. To load a language into all LIVE forms in your app:
  

  
       procedure TMainForm.LateInitialize;
  
       begin
  
        LoadForm(Self);
  
        Translator:= TTranslator.Create;
  

  
        // If no translation was selected (program's first start) the "Choose Language" dialog will appear.
  
        Translator.LoadLastTranslation;
  
       end;
  

  

  
    2. To load a language into a form that is no live (we do it on form's creation):
  

  
       procedure TDynamicForm.Initialize;
  
       begin
  
        // Call LoadFormTranlation() for DYNAMICALLY created forms, when they are created
  
        Translator.LoadFormTranlation(DynamicForm);
  
       end;
  

  

  
    3. Save all live forms to the INI file to be translated:
  

  
       a. Call Translator.SaveTranslation;  //Note: Only currently existing/live forms will be saved to disk.
  
       b. Manually translate the text (or use www.DeepL.com). There is a helper tool in FormTranslator.pas.
  
       c. Place the new translated file to the 'Lang' folder. The program will discover the new file when the ShowSelectLanguage procedure is called (no need to restart).
  

  

  
    4. Let the user choose/switch a language:
  

  
       a. Call FormSelectLang.pas ShowSelectLanguage
  
       b. Languages are switched 'Live'. No need to restart the program.
  

  
--------------------------------------------------------------------------------------------------------------
  

  
    INFO
  
       The path where the translation files are stored is returned by GetLangFolder().
  
       If no translation if found in the INI file for a GUI control, its text will be left untranslated.
  
       Mark controls that should not be translated (for ex, labels that will have their caption changed dynamically) with Tag=128
  

  
    WARNING
  
       Make sure you make your GUI controls (lables, buttons, etc) large enough. Some languages require more space (more charaters) than others.
  

  
    TESTER
  
       c:\Myprojects\Packages\CubicCommonControls\Demo\Translation system\TranslatorTester.dpr
  
--------------------------------------------------------------------------------------------------------------
  

  
