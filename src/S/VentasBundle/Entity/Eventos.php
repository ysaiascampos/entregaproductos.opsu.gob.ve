<?php

namespace S\VentasBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Eventos
 *
 * @ORM\Table(name="eventos", uniqueConstraints={@ORM\UniqueConstraint(name="eventos_nombre_key", columns={"nombre"})})
 * @ORM\Entity(repositoryClass="S\VentasBundle\Repository\EventosR")
 */
class Eventos
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="eventos_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nombre", type="string", length=45, nullable=false)
     */
    private $nombre;

    /**
     * @var string
     *
     * @ORM\Column(name="descripcion", type="string", length=250, nullable=false)
     */
    private $descripcion;

    /**
     * @var integer
     *
     * @ORM\Column(name="tipo_pago", type="integer", nullable=false)
     */
    private $tipoPago = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="roles_usuario", type="text", nullable=true)
     */
    private $rolesUsuario;

    /**
     * @var integer
     *
     * @ORM\Column(name="estatus", type="integer", nullable=false)
     */
    private $estatus = '0';

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fecha", type="datetime", nullable=true)
     */
    private $fecha;



    /**
     * Set nombre
     *
     * @param string $nombre
     *
     * @return Eventos
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * Get nombre
     *
     * @return string
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     *
     * @return Eventos
     */
    public function setDescripcion($descripcion)
    {
        $this->descripcion = $descripcion;

        return $this;
    }

    /**
     * Get descripcion
     *
     * @return string
     */
    public function getDescripcion()
    {
        return $this->descripcion;
    }

    /**
     * Set tipoPago
     *
     * @param integer $tipoPago
     *
     * @return Eventos
     */
    public function setTipoPago($tipoPago)
    {
        $this->tipoPago = $tipoPago;

        return $this;
    }

    /**
     * Get tipoPago
     *
     * @return integer
     */
    public function getTipoPago()
    {
        return $this->tipoPago;
    }

    /**
     * Set rolesUsuario
     *
     * @param string $rolesUsuario
     *
     * @return Eventos
     */
    public function setRolesUsuario($rolesUsuario)
    {
        $this->rolesUsuario = $rolesUsuario;

        return $this;
    }

    /**
     * Get rolesUsuario
     *
     * @return string
     */
    public function getRolesUsuario()
    {
        return $this->rolesUsuario;
    }

    /**
     * Set estatus
     *
     * @param integer $estatus
     *
     * @return Eventos
     */
    public function setEstatus($estatus)
    {
        $this->estatus = $estatus;

        return $this;
    }

    /**
     * Get estatus
     *
     * @return integer
     */
    public function getEstatus()
    {
        return $this->estatus;
    }

    /**
     * Set fecha
     *
     * @param \DateTime $fecha
     *
     * @return Eventos
     */
    public function setFecha($fecha)
    {
        $this->fecha = $fecha;

        return $this;
    }

    /**
     * Get fecha
     *
     * @return \DateTime
     */
    public function getFecha()
    {
        return $this->fecha;
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }
    
    public function __toString() {
        
        return $this->nombre;
    }
}
