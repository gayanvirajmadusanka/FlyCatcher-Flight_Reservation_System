<style>

    .social-menu ul {
        position: absolute;
        top: 120%;
        left: 80%;
        transform: translate(-50%, -50%);
        padding: 0;
        margin: 0;
        display: flex;
    }
    .social-menu ul li {
        list-style: none;
        margin: 0 10px;
    }
    .social-menu ul li .fa {
        color: #000000;
        font-size: 25px;
        line-height: 50px;
        transition: .5s;
    }
    .social-menu ul li .fa:hover {
        color: #ffffff;
    }
    .social-menu ul li a {
        position: relative;
        display: block;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background-color: white;
        text-align: center;
        transition: 0.5s;
        transform: translate(0,0px);
        box-shadow: 0px 7px 5px rgba(0, 0, 0, 0.5);
    }
    .social-menu ul li a:hover {
        transform: rotate(0deg) skew(0deg) translate(0, -10px);
    }
    .social-menu ul li:nth-child(1) a:hover {
        background-color: #3b5999;
    }
    .social-menu ul li:nth-child(2) a:hover {
        background-color: #55acee;
    }
    .social-menu ul li:nth-child(3) a:hover {
        background-color: #e4405f;
    }
    .social-menu ul li:nth-child(4) a:hover {
        background-color: #cd201f;
    }
    .social-menu ul li:nth-child(5) a:hover {
        background-color: #0077B5;
    }







</style>

<footer class="page-footer" style="background-image: url(8.jpg); background-size:cover; padding-top: 5%;">

    <div class="container" >

        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">Contact us</h5>
                <h4 class="grey-text text-lighten-4">+947 **** **** </h4>
            </div>
            <div class="col l4 offset-l2 s12">
                <div class="social-menu">

                    <ul>
                        <li><a href=""><i class="fa fa-facebook"></i></a></li>
                        <li><a href=""><i class="fa fa-twitter"></i></a></li>
                        <li><a href=""><i class="fa fa-instagram"></i></a></li>
                        <li><a href=""><i class="fa fa-youtube"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
    <div class="footer-copyright" style="background-color:rgba(0, 0, 0, 0.54);">
        <div class="container">
            © 2020 Copyright Gayan Madusanka, Dolitha Liyanage
            <a class="grey-text text-lighten-4 right" href="">GitHub Link</a>
        </div></div>

</footer>