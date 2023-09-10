import { useContext, useEffect, useState } from "react";
import { Badge, Button, Col, Container, Form, Nav, Navbar, NavDropdown, Row } from "react-bootstrap";
import { Link, useNavigate } from "react-router-dom";
import { MyCartContext, MyUserContext } from "../App";
import Apis, { endpoints } from "../configs/Apis";
import MySpinner from "./MySpinner";

const Header = () => {
    const [user, dispatch] = useContext(MyUserContext);
    const [cartCounter, ] = useContext(MyCartContext);
    const [categories, setCategories] = useState(null)
    const [kw, setKw] = useState("")
    const nav = useNavigate();

    useEffect(() => {
        const loadCates = async () => {
            let res = await Apis.get(endpoints['categories']);

            setCategories(res.data);
        }

        loadCates();
    }, []);

    const search = (evt) => {
        evt.preventDefault();

        nav(`/?kw=${kw}`);
    }

    const logout = () => {
        dispatch({
            "type": "logout"
        })
    }

    if (categories === null)
        return <MySpinner />;

    return (
        <Navbar expand="lg" className="bg-body-tertiary ">
            <Container>
            <Navbar.Brand className="align-items-center d-flex" href="/"><img alt="Logo" src={require("../Aset/images/chef1.png")} style={{ width: '70px' }} className="me-1" />Onl Fooding</Navbar.Brand>
            <Navbar.Toggle aria-controls="basic-navbar-nav" />
            <Navbar.Collapse id="basic-navbar-nav">
                <Nav className="me-auto">
                <Link className="nav-link" to="/">Trang chủ</Link>
                
                <NavDropdown title="Danh mục món" id="basic-nav-dropdown">
                    {categories.map(c => {
                        let h = `/?cateId=${c.id}`;
                        return <Link to={h} className="dropdown-item nav-link" key={c.id}>{c.name}</Link>;
                    })}
                    
                </NavDropdown>
                {user === null?<>
                    <Link className="nav-link" to="/login">Đăng nhập</Link>
                    <Link className="nav-link" to="/register">Đăng ký</Link>
                </>:<>
                
                    <Link className="nav-link" to="/userdetails">Chào {user.username}!</Link>
                    <img src={user.avatar} class="rounded-circle me-4" style={{width: 40}} alt="Avatar" />
                    <Button onClick={logout} variant="secondary">Đăng xuất</Button>
                </>}
                </Nav>
                <Link className="nav-link me-5 " to="/cart">&#128722; <Badge bg="danger">{cartCounter}</Badge></Link>
                
            </Navbar.Collapse>
            <Form onSubmit={search} inline>
                <Row>
                <Col xs="auto">
                    <Form.Control
                    type="text"
                    value={kw}
                    onChange={e => setKw(e.target.value)}
                    placeholder="Nhập từ khóa..."
                    className=" mr-sm-2"
                    />
                </Col>
                <Col xs="auto">
                    <Button type="submit">Tìm</Button>
                </Col>
                </Row>
            </Form>
            </Container>
        </Navbar>
    )
}

export default Header;