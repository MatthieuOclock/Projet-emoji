import React from "react";
import Search from "./search.js";
import "./header.sass";

const header = () => { 
    return(
    <>
        <header role="banner"> 
            <nav role="navigation">
                <div>
                    <a>Logo</a>
                </div>
                <Search />
                <div class="connextion">
                    <a>Connextion</a>
                </div>
            </nav>
        </header>
    </>
    ); 
}

export default header; 