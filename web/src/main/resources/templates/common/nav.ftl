<header>
    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
        <a class="navbar-brand my-0 mr-md-auto font-weight-normal text-dark" href="/">易拍</a>
        <nav class="my-2 my-md-0 mr-md-3">
            <a class="p-2 text-dark" href="${ctx}/order/list">我的订单</a>
            <a class="p-2 text-dark" href="#">客服</a>
        </nav>
        <form class="form-inline mt-2 mt-md-0" action="${ctx}/search">
            <input class="form-control mr-sm-2" name="keyWords" type="text" placeholder="搜索关键字" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" onclick="submit">找找看</button>
        </form>
        <@login/>
    </div>
</header>