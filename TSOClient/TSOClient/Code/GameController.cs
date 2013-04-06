﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TSOClient.Code.UI.Screens;

namespace TSOClient.Code
{
    /// <summary>
    /// Handles the game flow between various game modes, e.g. login => city view
    /// </summary>
    public class GameController
    {
        /// <summary>
        /// Start the preloading process
        /// </summary>
        public void StartLoading()
        {
            //var screen = new LoginScreen();
            //var screen = new CoreGameScreen();
            //var screen = new PersonSelection();
            //var screen = new Credits();
            //var screen = new PersonSelectionEdit();

            ShowLogin();
            if (true)
            {
                return;
            }

            var screen = new LoadingScreen();
            
            GameFacade.Screens.AddScreen(screen);
            ContentManager.InitLoading();
        }


        /// <summary>
        /// Show the login screen
        /// </summary>
        public void ShowLogin()
        {
            var screen = new LoginScreen();

            /** Remove preload screen **/
            GameFacade.Screens.RemoveCurrent();
            GameFacade.Screens.AddScreen(screen);
        }


        /// <summary>
        /// Go to the person selection page
        /// </summary>
        public void ShowPersonSelection()
        {
            var screen = new PersonSelection();
            GameFacade.Screens.RemoveCurrent();
            GameFacade.Screens.AddScreen(screen);
        }


        public void ShowPersonCreation()
        {
            var screen = new PersonSelectionEdit();
            GameFacade.Screens.RemoveCurrent();
            GameFacade.Screens.AddScreen(screen);
        }



        public void StartDebugTools()
        {
            if (GameFacade.DebugWindow != null)
            {
                if (GameFacade.DebugWindow.Visible)
                {
                    GameFacade.DebugWindow.Hide();
                }
                else
                {
                    GameFacade.DebugWindow.Show();
                }
                return;
            }


            var debugWindow = new TSOClient.Code.Debug.TSOClientTools();
            GameFacade.DebugWindow = debugWindow;

            /** Position the debug window **/

            System.Windows.Forms.Form gameWindowForm = 
                (System.Windows.Forms.Form)System.Windows.Forms.Form.FromHandle(GameFacade.Game.Window.Handle);
            debugWindow.Show();

            debugWindow.PositionAroundGame(gameWindowForm);
            
        }


    }
}
