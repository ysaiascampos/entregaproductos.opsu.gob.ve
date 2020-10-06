<?php

namespace S\VentasBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Bitacora
 *
 * @ORM\Table(name="bitacora", indexes={@ORM\Index(name="bitacora_id_usuario_idx", columns={"id_usuario"})})
 * @ORM\Entity(repositoryClass="S\VentasBundle\Repository\BitacoraR")
 */
class Bitacora
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="bitacora_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="tabla", type="string", length=45, nullable=false)
     */
    private $tabla;

    /**
     * @var integer
     *
     * @ORM\Column(name="id_registro", type="integer", nullable=false)
     */
    private $idRegistro;

    /**
     * @var string
     *
     * @ORM\Column(name="registro", type="array", nullable=false)
     */
    private $registro;

    /**
     * @var string
     *
     * @ORM\Column(name="ip", type="string", length=45, nullable=true)
     */
    private $ip;

    /**
     * @var string
     *
     * @ORM\Column(name="accion", type="text", nullable=false)
     */
    private $accion;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="creates", type="datetime", nullable=true)
     */
    private $create;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="updates", type="datetime", nullable=true)
     */
    private $update;

    /**
     * @var \FosUser
     *
     * @ORM\ManyToOne(targetEntity="FosUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_usuario", referencedColumnName="id")
     * })
     */
    private $idUsuario;



    /**
     * Set tabla
     *
     * @param string $tabla
     *
     * @return Bitacora
     */
    public function setTabla($tabla)
    {
        $this->tabla = $tabla;

        return $this;
    }

    /**
     * Get tabla
     *
     * @return string
     */
    public function getTabla()
    {
        return $this->tabla;
    }

    /**
     * Set idRegistro
     *
     * @param integer $idRegistro
     *
     * @return Bitacora
     */
    public function setIdRegistro($idRegistro)
    {
        $this->idRegistro = $idRegistro;

        return $this;
    }

    /**
     * Get idRegistro
     *
     * @return integer
     */
    public function getIdRegistro()
    {
        return $this->idRegistro;
    }

    /**
     * Set registro
     *
     * @param string $registro
     *
     * @return Bitacora
     */
    public function setRegistro($registro)
    {
        //$this->registro = $registro;
        
        $this->registro = "[";
        $ban=0;
        foreach ($registro as $key => $reg) {
            if($ban==1){
              $this->registro .=",";
            }
            $this->registro .="'".$key."'=>'".$reg."'";
            $ban=1;
        }
        $this->registro .="]";

        return $this;
    }

    /**
     * Get registro
     *
     * @return string
     */
    public function getRegistro()
    {
        $registro = $this->registro;
        return $this->registro;
    }

    /**
     * Set ip
     *
     * @param string $ip
     *
     * @return Bitacora
     */
    public function setIp($ip)
    {
        $this->ip = $ip;

        return $this;
    }

    /**
     * Get ip
     *
     * @return string
     */
    public function getIp()
    {
        return $this->ip;
    }

    /**
     * Set accion
     *
     * @param string $accion
     *
     * @return Bitacora
     */
    public function setAccion($accion)
    {
        $this->accion = $accion;

        return $this;
    }

    /**
     * Get accion
     *
     * @return string
     */
    public function getAccion()
    {
        return $this->accion;
    }

    /**
     * Set create
     *
     * @param \DateTime $create
     *
     * @return Bitacora
     */
    public function setCreate($create)
    {
        $this->create = $create;

        return $this;
    }

    /**
     * Get create
     *
     * @return \DateTime
     */
    public function getCreate()
    {
        return $this->create;
    }

    /**
     * Set update
     *
     * @param \DateTime $update
     *
     * @return Bitacora
     */
    public function setUpdate($update)
    {
        $this->update = $update;

        return $this;
    }

    /**
     * Get update
     *
     * @return \DateTime
     */
    public function getUpdate()
    {
        return $this->update;
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

    /**
     * Set idUsuario
     *
     * @param \S\VentasBundle\Entity\FosUser $idUsuario
     *
     * @return Bitacora
     */
    public function setIdUsuario(\S\VentasBundle\Entity\FosUser $idUsuario = null)
    {
        $this->idUsuario = $idUsuario;

        return $this;
    }

    /**
     * Get idUsuario
     *
     * @return \S\VentasBundle\Entity\FosUser
     */
    public function getIdUsuario()
    {
        return $this->idUsuario;
    }
}
