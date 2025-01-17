import React from "react";
import { BrowserRouter as Router, Route, Routes, Link } from "react-router-dom";
import { ToastContainer } from "react-toastify";

import "./reset.sass"; 
import Header from "./header/header";

import Acceuil from "./main/Accueil/accueil.js";

const App = () => { 
    return( 
        <> 
            <Router>
                <Header />

                <Routes>
                    <Route path="*" element={<Acceuil/>} />
                    <Route path="/acceuil" element={<Acceuil/>} />
                </Routes> 
            </Router>
        </>
    )
}

export default App; 