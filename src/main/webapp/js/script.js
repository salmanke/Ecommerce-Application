function add_to_cart(pId, pName, price) {
	let cart = localStorage.getItem("cart");

	if (null == cart) {
		
		let pCart = []
		let product = { productId: pId, productName: pName, productQty : 1, productPrice: price };
		pCart.push(product);
		console.log('in null');
		localStorage.setItem("cart", JSON.stringify(pCart));
	}
	else {
		let pCart = JSON.parse(cart);
		console.log(pCart);

		let oldProduct = pCart.find(item => item.productId == pId);
		console.log(pId);
		//console.log(oldProduct.productId);
		console.log(oldProduct);
		if (oldProduct) {
			pCart.map(
				item => {
					if (item.productId == oldProduct.productId) {
						item.productQty = oldProduct.productQty + 1;
					}
				}
			)
		}
		else {
			let product = { productId: pId, productName: pName, productQty: 1, productPrice: price };
			pCart.push(product);
			console.log("new");
		}
		console.log('not in  null');
		localStorage.setItem("cart", JSON.stringify(pCart));

	}

	console.log("item added");
	updateCart();

}

function updateCart() {
	let partString = localStorage.getItem('cart');

	let cart = JSON.parse(partString);
	if (cart == null || cart.length == 0) {
		$(".cart-item").html("(0)");
		$("#cart-body").html("No items in cart");
		$(".chkout-btn").attr("disabled", "disabled");
		$(".chkout-btn").addClass("btn-secondary").removeClass("btn-primary");



	} else {
		$(".cart-item").html(`(${cart.length})`);

		$(".chkout-btn").removeAttr("disabled");
		$(".chkout-btn").addClass("btn-primary").removeClass("btn-secondary");
		let table = `
					<table >
						<thread>
							<tr>
								<th>Product Name</th>
								<th>Price</th>
								<th>Qty</th>
								<th>Total</th>
								<th>Action</th>
							</tr>
						</thread>
						
					`
		let totalPrice = 0;
		cart.map(
			item => {
				table += `
						<tr>
							<td value="${item.productName}">${item.productName}</td>
							<td value="${item.productPrice}">${item.productPrice}</td>
							<td value="${item.productQty}">${item.productQty}</td>
							<td value="${item.productQty * item.productPrice}">${item.productQty * item.productPrice}</td>
							<td><button class="btn btn-danger btn-sm" 
									onclick="deleteProductFromCart(${item.productId})">
							Remove
							</button>
							</td>
						</tr>
						
					`
				totalPrice += (item.productQty * item.productPrice);
			})

		table += `
						<tr>
							<td></td>
							<td colspan="2" class="font-weight-bold">
							Total Price
							</td>
							<td class="font-weight-bold">${totalPrice}</td>
						</tr>
						
					</table>
					`
		$("#cart-body").html(table);


	}


}

function deleteProductFromCart(pId) {
	let cart = JSON.parse(localStorage.getItem("cart"));
	let newCart = cart.filter(item => item.productId != pId);
	localStorage.setItem("cart", JSON.stringify(newCart));
	updateCart();
}

//triggered by dom when all html elements in body tag are constructed 
$(document).ready(
	//anonymous function
	function() {
		updateCart();
	}
)
